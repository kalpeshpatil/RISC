module RegisterFile(
In_RF_Read_addr1, In_RF_Read_addr2,
Out_RF_Read_data1, Out_RF_Read_data2,
In_RF_Write_addr1,
In_RF_Write_data1, In_RF_Write_en_1,
In_clock,
In_reset,
reg_0,reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7
);

integer i;
input [2:0] In_RF_Read_addr1,In_RF_Read_addr2,In_RF_Write_addr1;
input In_clock,In_reset, In_RF_Write_en_1;
input [15:0] In_RF_Write_data1;
output reg [15:0] Out_RF_Read_data1, Out_RF_Read_data2;
reg [15:0] register [0:7];
output wire [15:0] reg_0,reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7;
initial begin
register[0]=16'd0;
register[1]=16'd0;
register[2]=16'd0;
register[3]=16'd0;
register[4]=16'd0;
register[5]=16'd0;
register[6]=16'd0;
register[7]=16'd0;
end

assign reg_0 = register[0];
assign reg_1 = register[1];
assign reg_2 = register[2];
assign reg_3 = register[3];
assign reg_4 = register[4];
assign reg_5 = register[5];
assign reg_6 = register[6];
assign reg_7 = register[7];
always @(*)
begin
	if(!In_reset && (!In_RF_Write_en_1 || (In_RF_Write_en_1 &&(In_RF_Read_addr1 != In_RF_Write_addr1) )))
	begin
		Out_RF_Read_data1 <= register[In_RF_Read_addr1];
	end
end

always @(*)
begin
	if (!In_reset && (!In_RF_Write_en_1 || (In_RF_Write_en_1 &&(In_RF_Read_addr2 != In_RF_Write_addr1) )))
	begin
		Out_RF_Read_data2 <= register[In_RF_Read_addr2];
	end
end

always @(posedge In_clock)
begin
	if(!In_reset && In_RF_Write_en_1)begin
		register [In_RF_Write_addr1] <= In_RF_Write_data1;
	end
	else if(In_reset) begin
	 for (i = 0; i<8; i = i+1) begin
		register [i] <= 16'b0;
		end
	end
end
endmodule

//module regFiles(A1, A2, AIn, Rf1, Rf2, RfIn, regWrite);
// input wire [2:0] A1, A2, AIn;
// output reg [15:0] Rf1, Rf2;
// input wire [15:0] RfIn;					
// input wire regWrite;					//1 -> write & 0 -> read
// reg [15:0] register [0:7];
// 
//always@(*)
//begin
// if(regWrite == 1)
//	begin
//		register[AIn] = RfIn;
//	end
// else
//   begin
//		Rf1 = register[A1];
//		Rf2 = register[A2];
//	end
//end
// endmodule