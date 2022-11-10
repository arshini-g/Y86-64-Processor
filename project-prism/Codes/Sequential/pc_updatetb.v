module pc_updatetb;
  reg clk;
  reg [3:0] icode;
  reg j_cnd;
  reg [63:0] valC;
  reg [63:0] valP;
  reg [63:0] valM;
  wire [63:0] pc_new;
  
  pc_update pc_update(
    .clk(clk),
    .icode(icode),
    .j_cnd(j_cnd),
    .valC(valC),
    .valM(valM),
    .valP(valP),
    .pc_new(pc_new)
  );
  
  initial begin
    $dumpfile("pc_update.vcd");
    $dumpvars(0,pc_updatetb);
    clk=0;
    icode=4'b0111;
    j_cnd=1'b1;
    valC=64'b01;
    valM=64'b101;
    valP=64'b11;
    #10 clk=~clk;
    #10;
  end
    initial 
      $monitor("clk=%d icode=%b j_cnd=%b valC=%d,valP=%d valM=%d pc_new=%d\n",clk,icode,j_cnd,valC,valP,valM,pc_new);
endmodule
