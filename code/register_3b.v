module register_3b (in,out, flag, clock);
input wire[2:0] in;
output reg [2:0] out;
output reg flag;
input wire clock;



always @(*)
begin
if (out==3'b111)
  begin
   flag<=0;
end
else flag<=1;
end

always @(*)
begin
out<=in;
end
endmodule
