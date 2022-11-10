module xorgate(x,y,z);
  input x,y;
  output z;
  xor g1(z,x,y);
  
endmodule
module xorfunc(a,b,ans);
  input [63:0] a;
  input [63:0] b;
  output [63:0] ans;

  genvar i;
  generate for(i=0; i<64; i=i+1) 
  begin
    xorgate g1(a[i],b[i],ans[i]);
  end
  endgenerate
endmodule
