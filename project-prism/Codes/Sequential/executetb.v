module execute_tb;
  reg clk;
  reg [3:0] icode;
  reg [3:0] ifun;
  reg [63:0] valA;
  reg [63:0] valB;
  reg [63:0] valC;
 // reg PC [64:0];
  wire ZF;
  wire SF;
  wire  OF;
  wire [63:0] valE;
  wire cond;
  
   execute execute(
    .clk(clk),
    .icode(icode),
    .ifun(ifun),
    .valA(valA),
    .valB(valB),
    .valC(valC),
    .ZF(ZF),
    .SF(SF),
    .OF(OF),
    .valE(valE),
    .cond(cond)
  );
 
  initial begin
    $dumpfile("execute.vcd");
    $dumpvars(0,execute_tb);
    
    clk=0;
    clk = ~clk;
    icode = 4'b0110;
    ifun = 4'b0000;
    valA = 64'b1;
    valB = 64'b1;
    #10;
    icode = 4'b1010;
    valA = 64'b0;
    valB = 64'b101;
    #10;
  end 
    initial 
      $monitor("clk=%d icode=%b ifun=%b valA=%d valB=%d valC=%d ZF=%d SF=%d OF=%d valE=%d cond=%d\n",clk,icode,ifun,valA,valB,valC,ZF,SF,OF,valE,cond);
  
endmodule
