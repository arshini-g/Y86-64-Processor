module pc_update(clk,icode,j_cnd,valC,valM,valP,pc_new);
  
  input clk;
  input [3:0] icode;
  input j_cnd;
  input [63:0] valC;
  input [63:0] valP;
  input [63:0] valM;
  output reg [63:0] pc_new;

always@(posedge clk) 
  begin 
    
    if(icode == 4'b0111) 
    begin
      if(j_cnd == 1'b1)
      begin
        pc_new = valC;
      end
      else
      begin
        pc_new = valP;
      end
    end
    
    else if(icode == 4'b1000) 
    begin
      pc_new = valC;
    end
    
    else if(icode == 4'b1001) 
    begin
      pc_new = valM;
    end
    
    else
    begin
      pc_new = valP;
    end
    
  end

end module
