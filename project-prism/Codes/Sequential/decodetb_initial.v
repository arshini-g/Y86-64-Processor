
   
module decodetb;
  
  reg clk;
  reg [63:0] reg_mem[0:14];

  reg [3:0] icode;
  reg [3:0] rA;
  reg [3:0] rB; 
  reg [3:0] rsp; 
  wire [63:0] valA;
  wire [63:0] valB;
  
  
  decode decode(
    .clk(clk),
    .icode(icode),
    .rA(rA),
    .rB(rB),
    .rsp(rsp),
    .valA(valA),
    .valB(valB)
  );
  initial 
    begin 
  
    clk=0;
    //PC=64'd0;
    

    #10 clk=~clk;
    icode = 4'b0100;
    rA = 1'd0;
    rB = 1'd1;
    rsp = 4'b0100;
   /* #10 clk=~clk;
    #10 clk=~clk;PC=valP;
    #10 clk=~clk;   */
  
  end
  
   initial 
     $monitor("clk=%b icode=%b rA=%b rB=%b valA=%d valB=%d\n",clk,icode,rA,rB,valA,valB);
endmodule
