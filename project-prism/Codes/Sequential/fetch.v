module fetch(clk,PC,icode,ifun,rA,rB,valC,valP,instr_valid);

  input clk;
  input [63:0] PC;
  output reg [3:0] icode;
  output reg [3:0] ifun;
  output reg [3:0] rA;
  output reg [3:0] rB; 
  output reg [63:0] valC;
  output reg [63:0] valP;
  output reg instr_valid;

  reg [7:0] instr_mem[0:1023];

  reg [0:79] instr;
  
  initial begin
  
 //irmovq $0x1, %rax
  instr_mem[0]=8'b00110000; //3 0
  instr_mem[1]=8'b00000000; //F rB=0
  instr_mem[2]=8'b00000000;           
  instr_mem[3]=8'b00000000;           
  instr_mem[4]=8'b00000000;           
  instr_mem[5]=8'b00000000;           
  instr_mem[6]=8'b00000000;           
  instr_mem[7]=8'b00000000;           
  instr_mem[8]=8'b00000000;          
  instr_mem[9]=8'b00000001; //V=1

  end
  
always@(posedge clk) 
  begin 

    instr = {instr_mem[PC],
             instr_mem[PC+1],
             instr_mem[PC+2],
             instr_mem[PC+3],
             instr_mem[PC+4],
             instr_mem[PC+5],
             instr_mem[PC+6],
             instr_mem[PC+7],
             instr_mem[PC+8],
             instr_mem[PC+9]};
    
    instr_valid=1'b1;
    icode = instr[0:3];
    ifun = instr[4:7];
    
    
    if(icode == 4'b0000)
      begin 
        valP = PC + 64'd1;
      end 
    
    
    else if(icode == 4'b0001)
      begin 
         valP = PC + 64'd1;
      end 
    
    
    else if(icode == 4'b0010)
      begin 
         
         valP = PC + 64'd2;
        rA = instr[8:11];
        rB = instr[12:15];
      end 
    
    
    else if(icode == 4'b0011)
      begin 
        valP = PC + 64'd10;
        rB = instr[12:15];
        valC = instr[16:79];
        
      end 
    
    
    else if(icode == 4'b0100)
      begin 
        valP = PC + 64'd10;
        rA = instr[8:11];
        rB = instr[12:15];
        valC = instr[16:79];
      end 
   
    else if(icode == 4'b0101)
      begin 
        valP = PC + 64'd10;
        rA = instr[8:11];
        rB = instr[12:15];
        valC = instr[16:79];
      end 
   
    else if(icode == 4'b0110)
      begin 
        valP = PC + 64'd2;
        rA = instr[8:11];
        rB = instr[12:15];
      end 
   
    else if(icode == 4'b0111)
      begin 
        valP = PC + 64'd9;
        valC = instr[8:71];
      end 
    
    else if(icode == 4'b1000)
      begin 
        valP = PC + 64'd9;
        valC = instr[8:71];
      end 
    
    
    else if(icode == 4'b1001)//return 
      begin 
        valP = PC + 64'd1;
      end 
    
    else if(icode == 4'b1010)//push
      begin 
      rA=instr[8:11];
      valP=PC+64'd2;
      end 
    
    else if(icode == 4'b1011)//pop
      begin 
       rA=instr[8:11];
       valP=PC+64'd2;
      end 
    
    else 
      begin 
         instr_valid=1'b0;
      end
  end
  endmodule
