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
