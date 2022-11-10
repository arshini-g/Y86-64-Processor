module decodetb;
  
  reg clk;
  reg [3:0] icode;
  reg [3:0] rA;
  reg [3:0] rB; 
  reg [3:0] rsp; 
  reg [63:0] valE;
  reg [63:0] valM;
  wire [63:0] valA;
  wire [63:0] valB;
  wire [63:0] reg_mem0;
  wire [63:0] reg_mem1;
  wire [63:0] reg_mem2;
  wire [63:0] reg_mem3;
  wire [63:0] reg_mem4;
  wire [63:0] reg_mem5;
  wire [63:0] reg_mem6;
  wire [63:0] reg_mem7;
  wire [63:0] reg_mem8;
  wire [63:0] reg_mem9;
  wire [63:0] reg_mem10;
  wire [63:0] reg_mem11;
  wire [63:0] reg_mem12;
  wire [63:0] reg_mem13;
  wire [63:0] reg_mem14;
  reg [63:0] reg_mem[0:14];
  
  decode decode(
    .clk(clk),
    .icode(icode),
    .rA(rA),
    .rB(rB),
    .rsp(rsp),
    .valE(valE),
    .valM(valM),
    .valA(valA),
    .valB(valB),
    .reg_mem0(reg_mem0),
    .reg_mem1(reg_mem1),
    .reg_mem2(reg_mem2),
    .reg_mem3(reg_mem3),
    .reg_mem4(reg_mem4),
    .reg_mem5(reg_mem5),
    .reg_mem6(reg_mem6),
    .reg_mem7(reg_mem7),
    .reg_mem8(reg_mem8),
    .reg_mem9(reg_mem9),
    .reg_mem10(reg_mem10),
    .reg_mem11(reg_mem11),
    .reg_mem12(reg_mem12),
    .reg_mem13(reg_mem13),
    .reg_mem14(reg_mem14)
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
    #10 clk=~clk;
    icode = 4'b0010;
    rB = 64'b1;
    rsp = 4'b0100;
    valE=64'd5;
      /*
    #10 clk=~clk;PC=valP;
    #10 clk=~clk;   */
  
  end
  
   initial 
     $monitor("clk=%b icode=%b rA=%b rB=%b valA=%d valB=%d reg_mem0=%d reg_mem1=%d reg_mem2=%d reg_mem3=%d reg_mem4=%d reg_mem5=%d reg_mem6=%d reg_mem7=%d reg_mem8=%d reg_mem9=%d reg_mem10=%d reg_mem11=%d reg_mem12=%d reg_mem13=%d reg_mem14=%d\n", clk,icode,rA,rB,valA,valB,reg_mem0, reg_mem1, reg_mem2, reg_mem3, reg_mem4, reg_mem5, reg_mem6, reg_mem7, reg_mem8,reg_mem9, reg_mem10, reg_mem11, reg_mem12, reg_mem13, reg_mem14);
  
endmodule
