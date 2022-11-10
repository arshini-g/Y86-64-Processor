module memory_tb;
  
  reg clk;
  reg [3:0] icode;
  reg [63:0] valA;
  reg [63:0] valB;
  reg [63:0] valE;
  reg [63:0] valP;
  wire [63:0] valM;
  wire [63:0]datamem;
  
  
  memory memory(
    .clk(clk),
    .icode(icode),
    .valA(valA),
    .valB(valB),
    .valE(valE),
    .valP(valP),
    .valM(valM),
    .datamem(datamem)
    );
  
  initial 
    begin 
  
    clk = 0;
    #10 clk = ~clk;
    icode = 4'b0100;
    valA = 64'b101;
    valE = 64'b00;
       
   // #10 clk = ~clk;
  
  end
  
  
   initial 
     $monitor("clk=%b icode=%b valA=%d valB=%d valE=%d datamem=%b\n", clk,icode,valA,valB,valE,datamem);
  
endmodule
  
  
