module decode(clk,icode,rA,rB,rsp,valA,valB);

  input clk;
  input [3:0] icode;
  input [3:0] rA;
  input [3:0] rB;
  input [3:0] rsp;
  output reg [63:0] valA;
  output reg [63:0] valB;
 // reg reg_index;

  reg [63:0] reg_mem[0:14];
  
  //reg_index = rA[3] + rA[2]*2 + rA[1]*4 + rA[0]*8;
  
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
  
  //decode
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
  
    endmodule
