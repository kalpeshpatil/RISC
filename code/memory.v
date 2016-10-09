module Memory( In_Mem_Access_en,
In_Mem_Access_R_Wbar,
In_Mem_Access_addr,
In_Mem_Write_data,
Out_Mem_Read_data,
In_clock,
In_reset,
mem_21,mem_22,mem_23,mem_24,mem_25,mem_26
);
input In_Mem_Access_en,In_Mem_Access_R_Wbar,In_clock,In_reset;
input [15:0] In_Mem_Access_addr;
input [15:0] In_Mem_Write_data;
output reg [15:0] Out_Mem_Read_data;
reg [15:0] memory [0:63]; 
integer i;
output wire [15:0] mem_21,mem_22,mem_23,mem_24,mem_25,mem_26;


always @(posedge In_reset) begin
memory[0]=16'b1000000000011101;
memory[1]=16'b0100100110000101; 
memory[2]=16'b0100110110000101;
memory[3]=16'b0100000101010100;
memory[4]=16'b0100001101010101;
memory[5]=16'b0001000010000000;
memory[6]=16'b0010000001011000;
memory[7]=16'b0010011011011000;
memory[8]=16'b0001011011000000;
memory[9]=16'b0000100010100001;
memory[10]=16'b0000000000000000;
memory[11]=16'b0010110110110010;
memory[12]=16'b1100110101111010;
memory[13]=16'b0101100101010110;

memory[20]=16'b0000000000000001;
memory[21]=16'b0000000000001111;
memory[22]=16'b0000000000000000;
memory[23]=16'b1111111111111111;
memory[24]=16'b0000000001000101;
memory[25]=16'b0000000000000000;
memory[26]=16'b0000000000000000;

memory[29]=16'b0001011011000001;
memory[30]=16'b0001110110010111;
memory[31]=16'b0101000110000100;
memory[32]=16'b0100000110000000;
memory[33]=16'b0100001110000001;
memory[34]=16'b1100101001001100;
memory[35]=16'b0000000010010000;
memory[36]=16'b0000011100100010;
memory[37]=16'b0001001001111111;
memory[38]=16'b0001111111111100;

memory[46]=16'b0101010110000010;
memory[47]=16'b0101100110000011;
memory[48]=16'b0001011011111111;
memory[49]=16'b0101011110000101;
memory[50]=16'b0100111110000100;

end

assign mem_21 = memory[21];
assign mem_22 = memory[22];
assign mem_23 = memory[23];
assign mem_24 = memory[24];
assign mem_25 = memory[25];
assign mem_26 = memory[26];

always @(*) begin
 if(In_Mem_Access_R_Wbar && In_Mem_Access_en) begin
 Out_Mem_Read_data = memory[In_Mem_Access_addr];
 end
end

//always @(posedge In_clock)
//begin
//	if(!In_Mem_Access_R_Wbar && In_Mem_Access_en) begin
//	memory[In_Mem_Access_addr] <= In_Mem_Write_data;
//	end
////	else if(In_reset) begin
////	 for (i = 0; i<32; i = i+1) begin
////		memory [i] <= 16'b0;
////		end
////	end
//end


endmodule
//module memory(address, edb_in, MemWrite,MemRead, edb_out);
//
//input wire [15:0] address;
//input wire [15:0] edb_in;
//input wire MemRead,MemWrite; //10 -> read ; 01-> write ; 00 -> none; 
//output reg [15:0] edb_out;
//reg [15:0] memory [0:31];   //
//
//always @(*)
// begin
//	if(MemWrite)
//	 begin
//	   memory[address] = edb_in;
//	 end
//	if(MemRead)
//	 begin
//	   edb_out = memory[address];
//	 end
// end
//
//endmodule

