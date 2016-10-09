module regFiles(A1, A2, AIn, Rf1, Rf2, RfIn, regWrite);
 input wire [2:0] A1, A2, AIn;
 output reg [15:0] Rf1, Rf2;
 input wire [15:0] RfIn;					
 input wire regWrite;					//1 -> write & 0 -> read
 reg [15:0] register [0:7];
 
always@(*)
begin
 if(regWrite == 1)
	begin
		register[AIn] = RfIn;
	end
 else
   begin
		Rf1 = register[A1];
		Rf2 = register[A2];
	end
end
 endmodule