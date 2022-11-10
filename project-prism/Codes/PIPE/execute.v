module pipereg(out, in, stall, bubbleval, clock);

	input stall, clock;	
	parameter width = 8;
	input [width-1:0] in;	
	input [width-1:0] bubbleval;
	output reg [width-1:0] out;
	initial begin   
	     out <= bubbleval;
	end
	
	always @(posedge clock) 
	begin
	    if (!stall)
	        out <= in;
	end

endmodule

// ALU
module andgate(x,y,z);
  input x,y;
  output z;
  and g1(z,x,y);
endmodule

module andfunc(a,b,ans);
  input [63:0] a;
  input [63:0] b;
  output [63:0] ans;

  genvar i;
  generate for(i=0; i<64; i=i+1) 
  begin
    andgate g1(a[i],b[i],ans[i]);
  end
  endgenerate
endmodule

module xorgate(x,y,z);
  input x,y;
  output z;
  xor g1(z,x,y);
  
endmodule
module xorfunc(a,b,ans);
  input [63:0] a;
  input [63:0] b;
  output [63:0] ans;

  genvar i;
  generate for(i=0; i<64; i=i+1) 
  begin
    xorgate g1(a[i],b[i],ans[i]);
  end
  endgenerate
endmodule

module fulladder(sum,Cout,a,b,c);
input a,b,c;
  output sum,Cout;
  wire G,S,P; 
    and g1(G,a,b);
    xor g2(P,a,b);
    and g3(S,P,c);
    or g4(Cout,S,G);
    xor g5(sum,P,c);
endmodule 

module ADD(Cout,Result,A,B);
  input signed [63:0]A,B;
  output signed [63:0]Result;
  output signed Cout;
  wire signed [64:0] C;

  assign C[0]=0;
  genvar i;
  generate for(i=0; i<64; i=i+1) 
  begin
    fulladder fa1(Result[i],C[i+1],A[i],B[i],C[i]);
  end
    endgenerate
     //assign Cout = C[64];
  xor g6(Cout,C[63],C[64]);
endmodule

module not_gate(out,b);
  input signed [63:0]b;
  output signed [63:0]out;
    genvar i;
  generate for(i=0; i<64; i=i+1) 
  begin
    not g1(out[i],b[i]);
  end
    endgenerate
endmodule
  
module SUB(Cout,Result,A,B);
  
  input signed [63:0]A,B;
  output signed [63:0]Result;
  output Cout;
  wire signed [63:0]x;
  not_gate ng1(x,B);
  wire signed [63:0]y;
  wire C1;
  ADD g1(C1,y,1,x);
  ADD g2(Cout,Result,A,y);
  
endmodule

module ALU(cc,carry,op,select,ip1,ip2);
  
input [1:0]select;
input signed [63:0]ip1,ip2;
output reg [2:0] cc;
output reg signed[63:0]op;
output reg carry;
  wire signed [63:0]op1,op2,op3,op4;
  wire carry1,carry2;
  ADD g1(carry1,op1,ip1,ip2);
  SUB g2(carry2,op2,ip1,ip2);
  andfunc g3(ip1,ip2,op3);
  xorfunc g4(ip1,ip2,op4);
  
always @(*)
  begin 
  case(select)
    
    2'b00 : 
      begin
       op = op1;
       carry = carry1;
      end
    
    2'b01 : 
      begin 
        op = op2;
        carry = carry2;
      end
    
    2'b10 :
      begin
        op = op3;
        carry = 0;
      end
    
    2'b11 :
      begin
        op = op4;
        carry = 0;
      end
    
    default : 
      begin
      op = 64'b0;
      carry = 0;
      end
    
  endcase
  
    assign cc[2] = (op == 0) ? 1 : 0;
    assign cc[1] = (op[63] == 1) ? 1 : 0;
    assign cc[0] = (carry == 1) ? 1 : 0;
end

endmodule

// Branch condition
module set_cond(ifun, CC, Cnd);

	input [3:0] ifun;
	input [2:0] CC;
	output Cnd;

	// Jump conditions.
	parameter j = 4'b0;
	parameter jle = 4'b1;
	parameter jl = 4'b10;
	parameter je = 4'b11;
	parameter jne = 4'b100;
	parameter jge = 4'b101;
	parameter jg = 4'b110;

	wire ZF = CC[2];
	wire SF = CC[1];
	wire OF = CC[0];	
	
	assign Cnd =
	(ifun == j) | 
	(ifun == jle & ((ZF^OF)|ZF)) | 
	(ifun == jl & (SF^OF)) | 
	(ifun == je & ZF) | 
	(ifun == jne & ~ZF) | 
	(ifun == jge & (~SF^OF)) | 
	(ifun == jg & (~SF^OF)&~ZF);

endmodule
