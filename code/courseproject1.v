


module ALUold (clk, aluA, aluB, opSel, aluOut, zeroFlag,carryFlag);
 input wire clk;
 input wire [15:0] aluA;       //1st input of alu
 input wire [15:0] aluB;		//2nd input	
 input wire [1:0] opSel;      //add, nand, subtract
 output reg [15:0] aluOut;    //result
 output reg zeroFlag;
 output reg carryFlag;
 
 parameter none = 2'b00;
 parameter add = 2'b01;
 parameter compare = 2'b10;
 parameter nandop = 2'b11;
 integer i;
 reg cin;
 reg cout;
 always@(*)
 begin
   cin = carryFlag;
	case(opSel)
	add:
		 begin	
			for (i=0;i<16;i=i+1)
				begin
				 aluOut[i] = aluA[i]^aluB[i]^cin;
				 cout = (aluA[i] & aluB[i])|(aluB[i]&cin)|(aluA[i]&cin);
				 cin  = cout;
				end
			carryFlag = cout;
		end
	compare:
		begin
			if(aluA==aluB) zeroFlag = 1;
			else zeroFlag = 0;
		end
	nandop:
	   begin
			aluOut = ~(aluA & aluB);
		end
   none:
	   begin
		end
	endcase
end
endmodule

module ALUtestebench();
 reg clk;
 reg [15:0] aluA;       //1st input of alu
 reg [15:0] aluB;		//2nd input	
 reg[1:0] opSel;      //add, nand, subtract
 wire [15:0] aluOut;    //result
 wire zeroFlag;
 wire carryFlag;
 
 ALUold alu1(clk, aluA, aluB, opSel, aluOut, zeroFlag,carryFlag);
 
 initial begin
 clk = 1;

 #6 aluA = 25;
    aluB = 40;
	 opSel = 2'b01;
	 
#2 aluA = 25;
    aluB = 40;
	 opSel = 2'b10;
	 
#2 aluA = 25;
    aluB = 40;
	 opSel = 2'b11;
	 
#2 aluA = 25;
    aluB = 40;
	 opSel = 2'b00;
 end
 
 always @(*)
  begin
    clk <= #1 ~clk;
  end
 

 

endmodule


