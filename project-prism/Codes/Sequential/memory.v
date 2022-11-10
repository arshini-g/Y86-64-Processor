module memory(clk, icode, valA, valB, valE, valP, valM, datamem);
  input clk;
  input [3:0] icode;
  input [63:0] valA;
  input [63:0] valB;
  input [63:0] valE;
  input [63:0] valP;
  output reg [63:0] valM;
  output reg [63:0]datamem;
  reg [63:0] memory[0:1023];
  
  initial begin 
    memory[4] = 64'b10 ;
  end 
  
  always@(posedge clk)
  begin
    
    if(icode == 4'b0100) //rmmovq
    begin
      memory[valE] = valA;
      datamem = memory[valE];
    end 
    
    else if(icode==4'b0101) //mrmovq
    begin
      memory[valE] = valA;
      datamem = memory[valE];
    end 
    
    else if(icode==4'b1000)//call
      begin 
        memory[valE] = valP; 
        datamem = memory[valE];
      end
      
    else if(icode==4'b1001)//ret
      begin 
        valM = memory[valE]; 
      end
    
    else if(icode==4'b1010)//push
      begin 
        memory[valE] = valA; 
        datamem = memory[valE];
     end
    
    else if(icode==4'b1011)//pop
      begin 
       valM = memory[valA];
      end
    
    else
    datamem = 0;
    
    end
endmodule
