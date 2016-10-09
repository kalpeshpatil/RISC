module shifter(shEn,sclk,in,sF,SF_update);
input wire [8:0] in;
input wire sclk;
input wire shEn;
output reg sF;
output reg SF_update;
integer i = 0;

always @(posedge sclk) 
begin
if(in[7]==1) SF_update=0;
else SF_update=1;
if(shEn && i < 8)
		begin
			sF = in[7-i];
			i = i+1;
		end
		
end
endmodule
