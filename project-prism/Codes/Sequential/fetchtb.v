module fetchtb;
  reg clk;
  reg [63:0] PC; 
  wire [3:0] icode;
  wire [3:0] ifun;
  wire [3:0] rA;
  wire [3:0] rB; 
  wire [63:0] valC;
  wire [63:0] valP;

  fetch fetch(
    .clk(clk),
    .PC(PC),
    .icode(icode),
    .ifun(ifun),
    .rA(rA),
    .rB(rB),
    .valC(valC),
    .valP(valP)
  );
  
  initial begin 
    $dumpfile("fetch.vcd");
    $dumpvars(0,fetchtb);
    #10
    clk=0;
    PC=64'b00;

    #10 clk=~clk;
    #10
    
    $monitor("clk=%b PC=%d icode=%b ifun=%b rA=%b rB=%b,valC=%d,valP=%d\n",clk,PC,icode,ifun,rA,rB,valC,valP);

  end
endmodule
