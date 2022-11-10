module ADD(Cout,Result,A,B);
  input signed [63:0]A,B;
  output signed [63:0]Result;
  output signed Cout;
  wire signed [64:0] C;

  assign C[0]=0;
  genvar i;
  generate for(i=0; i<64; i=i+1) 
  begin
    fulladder fa1(Result[i],C[i+1],A[i],B[i],C[i]);
  end
    endgenerate
     //assign Cout = C[64];
  xor g6(Cout,C[63],C[64]);
endmodule
