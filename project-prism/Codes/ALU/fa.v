module fulladder(sum,Cout,a,b,c);
input a,b,c;
  output sum,Cout;
  wire G,S,P; 
    and g1(G,a,b);
    xor g2(P,a,b);
    and g3(S,P,c);
    or g4(Cout,S,G);
    xor g5(sum,P,c);
endmodule 
