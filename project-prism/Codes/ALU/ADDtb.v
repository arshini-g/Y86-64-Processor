module ADDtb;
  reg signed [63:0]A;
  reg signed [63:0]B;
  wire signed [63:0]Result;
  wire Cout;
  
ADD uut(
  .A(A), 
  .B(B), 
  .Result(Result),
  .Cout(Cout)
);
   initial begin
     $dumpfile("ADD.vcd");
     $dumpvars(0,ADDtb);
     $monitor($time," A=%b B=%b Cout=%d Result=%b",A,B,Cout,Result);
      #100
       #20 A=64'b1011;B=64'b0100;
       #20 A=64'b1011;B=64'b1100;
       #20 A=64'b10011;B=64'b0110;
       #20 A=64'b00101;B=64'b11011;
       #20 A=64'b0000000000000000000000000000000000000000000000000000000000000001;
      B=64'b0111111111111111111111111111111111111111111111111111111111111111;
       #20;
   end
 endmodule
