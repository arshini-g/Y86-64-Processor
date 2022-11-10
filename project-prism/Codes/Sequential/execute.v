module execute(clk,icode,ifun,valA,valB,valC,ZF,SF,OF,valE,cond);
  
  input clk;
  input [3:0] icode;
  input [3:0] ifun;
  input signed [63:0] valA;
  input signed [63:0] valB;
  input signed [63:0] valC;
  output reg ZF;
  output reg SF;
  output reg OF;
  output reg signed [63:0] valE;
  output reg cond;
  
  reg signed [63:0] ip1;
  reg signed [63:0] ip2;
  reg [1:0] select;
  wire carry;
  wire signed [63:0] op;
 // reg signed [63:0] 
  

  always@(*)
  begin
    if(icode==4'b0110 && clk==1)
    begin
      ZF=(op==1'b0);
      SF=(op[63]==1'b1);
      OF=(carry == 1);
    end
  end
  
    ALU alu(
    .carry(carry),
	.op(op),
    .select(select),          
    .ip1(ip1),                   
    .ip2(ip2)
  );
  
  
  always@(*) 
   begin 
   if(clk == 1)
    begin
	cond = 0;
	
      if(icode==4'b0010) //cmovxx
      begin
        if(ifun==4'b0000)//rrmovq
        begin
          cond=1;
        end
        else if(ifun==4'b0001)//cmovle
        begin
          if(SF^OF)
            cond = 1;
          else if(ZF)
              cond = 1;
        end
        
        else if(ifun==4'b0010)//cmovl
        begin
          if(SF^OF)
             cond = 1;
        end 
        
        else if(ifun==4'b0011)//cmove
        begin
          if(ZF)
             cond = 1;
        end
        
        else if(ifun==4'b0100)//cmovne
        begin
          if(~ZF)
             cond = 1;
        end
        
        else if(ifun==4'b0100)//cmovge
        begin
          if(~(SF^OF))
            cond = 1;
        end 
        
        else if(ifun==4'b0100)//cmovg
        begin
          if((~(SF^OF)) && (~ZF))
            cond = 1;
        end 
      end   
        
    //else if(icode == 4'b0011)//irmovq
    //  begin
       // valE=64'd0+valC;
     // end
    
    else if(icode == 4'b0100)//rmmovq
      begin
         select = 2'b00;
         ip1 = valB;
         ip2 = valC;
       // valE=valB+valC;
        // call ALU
      end
    
    else if(icode == 4'b0101) //mrmovq
      begin
         select = 2'b00;
         ip1 = valB;
         ip2 = valC;
        //valE=valB+valC;
        //call ALU
      end
    
    else if(icode == 4'b0110) //OPq
      begin
        if(ifun == 4'b0000) //add
        begin
          //valE=valA+valB;
          select = 2'b00;
          ip1 = valA;
          ip2 = valB;
        end
        
     else if(ifun == 4'b0001) //sub
       begin
          //valE=valA-valB;
          select = 2'b01;
          ip1 = valB;
          ip2 = valA;
        end
        
        else if(ifun == 4'b0010) //and
        begin
          //valE=valA.valB;
          select = 2'b10;
          ip1 = valA;
          ip2 = valB;
        end
        
        else if(ifun == 4'b0011) //xor
        begin
          //valE=valA^valB;
          select = 2'b11;
          ip1 = valA;
          ip2 = valB;
        end
        
       // assign anss=ans;
       // valE=anss;
      end
     
     if(icode==4'b0111) //jxx
      begin
        if(ifun==4'b0000)//jmp
        begin
          cond = 1;
        end 
        
        else if(ifun==4'b0001)//jle
        begin
          if(SF^OF)
            cond = 1;
          else if(ZF)
              cond = 1;
        end 
        
        else if(ifun==4'b0010)//jl
        begin
          if(SF^OF)
             cond = 1;
        end 
        
        else if(ifun==4'b0011)//je
        begin
          if(ZF)
            cond = 1;
        end 
        
        else if(ifun==4'b0100)//jne
        begin
          if(~ZF)
            cond = 1;
        end
        
        else if(ifun==4'b0101)//jge
        begin
           if(~(SF^OF))
            cond = 1;
        end
      
        else if(ifun==4'b0110)//jg
        begin
            if((~(SF^OF)) && (~ZF))
            cond = 1;
        end 
      end 
     
      else if(icode==4'b1000) //call
      begin
        valE=-64'd8+valB;
      end
    
      else if(icode==4'b1001) //ret
      begin
        select = 2'b00;
        ip1 = valB;
        ip2 = 64'd8;
        //valE=64'd8+valB;
        //call ALU
      end
    
      else if(icode==4'b1010) //pushq
      begin
        select = 2'b00;
        ip1 = -64'd8;
        ip2 = valB;
        //valE=-64'd8+valB;
        //call ALU
      end
    
      else if(icode==4'b1011) //popq
      begin 
        select = 2'b00; 
        ip1 = valB;
        ip2 = 64'b1000;
       //valE=64'd8+valB;
        //call ALU
      end
      
      //assign rax_dat = (dstM == 4'h0) ? valM : valE;
      assign valE = (icode == 0111 | icode == 0010) ? 0 : op;
//ALU g1(carry,valE,select,ip1,ip2);
        // set condition codes 
        //if(valE == 0)
          //ZF = 1;
        
        //if(valE < 1'b0)
          //SF = 1;
        
        //if(carry == 1)
          //OF = 1;
         
   
    end
	end
  
endmodule
