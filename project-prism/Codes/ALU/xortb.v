module xortb;
	reg [63:0] a;
	reg [63:0] b;
	wire [63:0] ans;
  
xorfunc uut (
.a(a), 
.b(b), 
.ans(ans)
);
  initial begin
	  $dumpfile("xorfunc.vcd");
	  $dumpvars(0,xortb);
    $monitor($time," a=%b b=%b ans=%b",a,b,ans);
      #100
      #20 a=64'b1011;b=64'b0100;
      #20 a=64'b1011;b=64'b1100;
      #20 a=64'b10011;b=64'b0110;
      #20 a=64'b00101;b=64'b11011;
    end
endmodule
