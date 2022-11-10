module SUBtb;
  reg [63:0]A;
  reg [63:0]B;
  wire [63:0]Result;
  wire Cout;
  
SUB uut(
  .A(A), 
  .B(B), 
  .Result(Result),
  .Cout(Cout)
);

  initial begin
    $dumpfile("SUB.vcd");
    $dumpvars(0,SUBtb);
    $monitor($time," A=%b B=%b Cout=%b Result=%b",A,B,Cout,Result);
   #100
      #20 A=64'b1011;B=64'b0100;
      #20 A=64'b1011;B=64'b1100;
      #20 A=64'b10011;B=64'b0110;
      #20 A=64'b00101;B=64'b11011;
      #20 A=64'b0111111111111111111111111111111111111111111111111111111111111111;B=-64'b1;
      #20;
  end
endmodule
