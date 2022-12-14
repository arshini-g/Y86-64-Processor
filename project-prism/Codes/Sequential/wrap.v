module wrap;
  reg clk;
  
  reg [63:0] PC;
  wire [3:0] icode;
  wire [3:0] ifun;
  wire [3:0] rA;
  wire [3:0] rB; 
  wire [63:0] valC;
  wire [63:0] valP;
  wire instr_valid;
  wire [63:0] valA;
  wire [63:0] valB;
  wire [63:0] valE;
  wire [63:0] valM;
  wire [3:0]rsp;
  wire [63:0] pc_new;
  
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
  wire [63:0] datamem;

  wire SF;
  wire ZF;
  wire OF;

  fetch fetch(
    .clk(clk),
    .PC(PC),
    .icode(icode),
    .ifun(ifun),
    .rA(rA),
    .rB(rB),
    .valC(valC),
    .valP(valP),
    .instr_valid(instr_valid)
  );

  execute execute(
    .clk(clk),
    .icode(icode),
    .ifun(ifun),
    .valA(valA),
    .valB(valB),
    .valC(valC),
    .valE(valE),
    .SF(SF),
    .ZF(ZF),
    .OF(OF),
    .cond(cond)
  );

  decode decode(
    .clk(clk),
    .icode(icode),
    .rA(rA),
    .rB(rB),
    .rsp(rsp),
    .valA(valA),
    .valB(valB),
    .valE(valE),
    .valM(valM),
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

  memory mem(
    .clk(clk),
    .icode(icode),
    .valA(valA),
    .valB(valB),
    .valE(valE),
    .valP(valP),
    .valM(valM),
    .datamem(datamem)
  );

  pc_update pcup(
    .clk(clk),
    .icode(icode),
    .j_cnd(j_cnd),
    .valC(valC),
    .valM(valM),
    .valP(valP),
    .pc_new(pc_new)
  ); 

  always #5 clk=~clk;

  initial begin
    $dumpfile("wrap.vcd");
    $dumpvars(0,wrap);
   
  always@(*)
  begin
    PC=pc_new;
  end

  initial 
		$monitor("clk=%d icode=%b ifun=%b rA=%b rB=%b valA=%d valB=%d valC=%d valE=%d valM=%d rsp=%d 0=%d 1=%d 2=%d 3=%d 4=%d 5=%d 6=%d 7=%d 8=%d 9=%d 10=%d 11=%d 12=%d 13=%d 14=%d datamem=%d\n",clk,icode,ifun,rA,rB,valA,valB,valC,valE,valM,instr_valid,rsp,reg_mem0,reg_mem1,reg_mem2,reg_mem3,reg_mem4,reg_mem5,reg_mem6,reg_mem7,reg_mem8,reg_mem9,reg_mem10,reg_mem11,reg_mem12,reg_mem13,reg_mem14,datamem);
		
endmodule
