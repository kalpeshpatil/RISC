module instruction_reg (op_code,ir_in, ir1,ir2,ir3,imm6,imm9,CB,clk,ir_write);
input wire [15:0] ir_in;
input wire clk;
input wire ir_write;
output reg [2:0] ir1,ir2,ir3;
output reg [3:0] op_code;
output reg [5:0] imm6;
output reg [8:0] imm9;
output reg [1:0] CB;

always @(*)
begin 
if (ir_write)
begin
op_code<=ir_in[15:12];
ir1<= ir_in[11:9];
ir2<= ir_in[8:6];
ir3<= ir_in[5:3];
imm6<=ir_in[5:0];
imm9<=ir_in[8:0];
CB<=ir_in[1:0];
end
end

endmodule
