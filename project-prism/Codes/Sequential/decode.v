module decode(clk,icode,rA,rB,rsp,valE,valM,valA,valB,reg_mem0,reg_mem1,reg_mem2,reg_mem3,reg_mem4,reg_mem5,reg_mem6,reg_mem7,reg_mem8,reg_mem9,reg_mem10,reg_mem11,reg_mem12,reg_mem13,reg_mem14);

  input clk;
  input [3:0] icode;
  input [3:0] rA;
  input [3:0] rB;
  input [3:0] rsp;
  input [63:0] valE;
  input [63:0] valM;
  output reg [63:0] valA;
  output reg [63:0] valB;

  reg [63:0] reg_mem[0:14];
  
  output reg [63:0] reg_mem0;
  output reg [63:0] reg_mem1;
  output reg [63:0] reg_mem2;
  output reg [63:0] reg_mem3;
  output reg [63:0] reg_mem4;
  output reg [63:0] reg_mem5;
  output reg [63:0] reg_mem6;
  output reg [63:0] reg_mem7;
  output reg [63:0] reg_mem8;
  output reg [63:0] reg_mem9;
  output reg [63:0] reg_mem10;
  output reg [63:0] reg_mem11;
  output reg [63:0] reg_mem12;
  output reg [63:0] reg_mem13;
  output reg [63:0] reg_mem14;
  
  initial begin 
    reg_mem[0] = 64'b0010;
    reg_mem[1] = 64'b0011;
    reg_mem[2] = 64'b0;
    reg_mem[3] = 64'b0;
    reg_mem[4] = 64'b0;
    reg_mem[5] = 64'b0;
    reg_mem[6] = 64'b0;
    reg_mem[7] = 64'b0;
    reg_mem[8] = 64'b0;
    reg_mem[9] = 64'b0;
    reg_mem[10] = 64'b0;
    reg_mem[11] = 64'b0;
    reg_mem[12] = 64'b0; 
    reg_mem[13] = 64'b0;
    reg_mem[14] = 64'b0;
    end 
  
//Decode
  always@(posedge clk)
  
  begin
    
    if(icode == 4'b0010) 
    begin
      valA = reg_mem[rA];
    end
    
    else if(icode == 4'b0100) 
    begin
      valA = reg_mem[rA];
      valB = reg_mem[rB];
    end
    
    else if(icode == 4'b0101) 
    begin
      valB = reg_mem[rB];
    end
    
    else if(icode == 4'b0110) 
    begin
      valA = reg_mem[rA];
      valB = reg_mem[rB];
    end
    
    else if(icode == 4'b1000) 
    begin
      valB=reg_mem[rsp]; 
    end
    
    else if(icode == 4'b1001) 
    begin
      valA = reg_mem[rsp];
      valB = reg_mem[rsp]; 
    end
    
    else if(icode == 4'b1010) 
    begin
      valA = reg_mem[rA];
      valB = reg_mem[rsp]; 
    end
    
    else if(icode == 4'b1011) 
    begin
      valA = reg_mem[rsp]; 
      valB = reg_mem[rsp]; 
    end
    
  end
  
  //Write back
  always@(negedge clk)
  
  begin
    
    if(icode == 4'b0010)
    begin
      reg_mem[rB] = valE;
    end
    
    else if(icode == 4'b0011) 
    begin
      reg_mem[rB] = valE;
    end
     
    else if(icode == 4'b0101)
    begin
      reg_mem[rA] = valM;
    end
    
    else if(icode == 4'b0110) 
    begin
      reg_mem[rB] = valE;
    end
    
    else if(icode==4'b1000)
    begin
      reg_mem[rsp] = valE;
    end
    
    else if(icode == 4'b1001)
    begin
      reg_mem[rsp] = valE;
    end
    
    else if(icode == 4'b1010) 
    begin
      reg_mem[rsp] = valE;
    end
    
    else if(icode == 4'b1011) 
    begin
      reg_mem[rsp] = valE;
      reg_mem[rA] = valM;
    end
    
    reg_mem0=reg_mem[0];
    reg_mem1=reg_mem[1];
    reg_mem2=reg_mem[2];
    reg_mem3=reg_mem[3];
    reg_mem4=reg_mem[4];
    reg_mem5=reg_mem[5];
    reg_mem6=reg_mem[6];
    reg_mem7=reg_mem[7];
    reg_mem8=reg_mem[8];
    reg_mem9=reg_mem[9];
    reg_mem10=reg_mem[10];
    reg_mem11=reg_mem[11];
    reg_mem12=reg_mem[12];
    reg_mem13=reg_mem[13];
    reg_mem14=reg_mem[14];
    
  end
  
    endmodule
