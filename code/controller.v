// datapath and fsm are written in one module 

module controller (mem_rst,clock,clock_50, curr_state, reg_7, reg_0,reg_6,edb_out,mem_21);
// in_out and control signals and their initialization
reg mem_en, mem_w_bar;
wire [15:0] mem_22,mem_23,mem_24,mem_25,mem_26;
output wire [15:0] mem_21;
wire [15:0] reg_1,reg_2,reg_3,reg_4,reg_5;
output wire [15:0] reg_6,reg_7,reg_0;
wire [15:0] ao_out,t2_out;
output wire [15:0]edb_out;
input wire clock_50; 

input wire mem_rst;

wire [15:0]t3_out, t1_out; 
reg address_sel; // control signal selection address_mux
reg t1_control;  // temporary register t1 control bit

wire [15:0] t3_in,t1_in;

reg [2:0]alu_op; // decides whether to add,nand, compare,....
reg [1:0] alu_funct;// depending on zero_flag, carry_flag
wire[15:0] aluA_wire,aluB_wire; // input to alua and alub respectivly
wire carry_flag,zero_flag,alu_write_en;
reg alu_rst; // reset bit to alu

reg alusrcA;// control signal alu a mux

wire [15:0]s6_16_out,s79_16_out,s97_16_out; // outputs of sign extenders
reg [2:0]alusrcB;// control signal aluB mux

wire [15:0]rf2,rf1,rf3; // 2 ouputs and 1 input to register file respectively

wire [5:0] imm6; // immediate 6 bit 	
wire [2:0]counter_out; // output of counter
wire [8:0] imm9; // immediate 9 bit 

reg sh_en,sclk; // shifter enable and clock for shifter respectively
wire sf_out; // output bit of shifter
wire R7_update; // signal bit which tells to update R7 or not
reg load0, counter_clock; 
wire c8; // flag set to 1 when counter is 7

wire [15:0]mdr_out; // output of mdr register
reg [1:0]rf3_control; // rf3 mux control signal

wire[2:0]a1,a2,a3; // address for registerFile
wire [2:0] a3_out; // output of a3 mux
wire a3_flag; // a3flag set if address in a3 is 3'b111

reg rf_wr_en, rf_rst;

wire [2:0]ir1,ir2,ir3; // to find to read from which registers (addresses of register file)
reg [1:0] a1_control,a2_control; // control signal for a1 and a2 mux respectively
reg [2:0] a3_control; // control signal for a1 mux

wire [3:0] op_code;
wire [1:0] CB; // last two bit for R type inst 
reg ir_write; // control bit decides to write in IR
 
reg pc_en; // control bit decides to write in PC
wire [15:0] pc_out; 



//clock universal
input wire clock;



//initialization of control signals
initial begin
mem_en = 1; mem_w_bar = 1; address_sel = 0; alu_op = 3'b001; alu_funct = 2'b11;
alu_rst = 0; alusrcA = 1; alusrcB = 3'b000;
sh_en = 0; sclk = 0; counter_clock = 0; load0 = 0; rf3_control = 2'b00;  rf_wr_en = 0; rf_rst = 0;
a1_control = 2'b10; a2_control = 2'b01; a3_control = 3'b100; ir_write = 0; t1_control=0;
end
//instantiation
Memory memory_0(mem_en, mem_w_bar, ao_out,t2_out, edb_out, clock, mem_rst,mem_21,mem_22,mem_23,mem_24,mem_25,mem_26);

instruction_reg ir_0(op_code,edb_out,ir1,ir2,ir3,imm6,imm9,CB,clock,ir_write);

mux2to1_16b address_mux(t1_out,t3_out, address_sel, ao_out);

temp_reg mdr(edb_out, mdr_out, clock);

mux4to1_3b a1_mux(ir1,ir2,3'b111,3'b000, a1_control, a1);

mux4to1_3b a2_mux(ir1,ir2,counter_out,3'b000, a2_control, a2);

mux8to1_3b a3_mux(ir1,ir2,ir3,counter_out,3'b111,3'b0,3'b0,3'b0, a3_control, a3);

mux4to1_16b rf3_mux( t3_out,mdr_out,pc_out,pc_out, rf3_control, rf3);

RegisterFile register_file_0(a1,a2,rf1,rf2,a3,rf3, rf_wr_en,clock,rf_rst,reg_0,reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7);

temp_reg t1(rf1, t1_out, clock);

temp_reg t2(rf2, t2_out, clock);

counter_3b counter_0(load0, c8, counter_clock, counter_out);

shifter shifter_0(sh_en, sclk, imm9, sf_out,R7_update);

se6_16 se6to16(imm6, s6_16_out);

se97_16 se97to16(imm9,s97_16_out);

se79_16 se79to16(imm9, s79_16_out);

mux2to1_16b t1_mux(rf1,t3_out, t1_control,t1_in);

mux2to1_16b aluA_mux(16'b0,t1_out, alusrcA, aluA_wire);

mux8to1_16b aluB_mux(16'b1, t2_out, s6_16_out, s97_16_out, s79_16_out, 16'b0,16'b0,16'b0, alusrcB,aluB_wire);

ALU alu_0(alu_op, alu_funct, aluA_wire, aluB_wire, carry_flag, zero_flag, alu_write_en, t3_in, clock, alu_rst);

temp_reg t3(t3_in, t3_out, clock);

temp_reg_with_en PC(t3_in, pc_out,clock,pc_en);

register_3b a3_reg(a3,a3_out,a3_flag,clock);




//parameter states
parameter fetch1 = 0;parameter fetch2 = 1;parameter fetch_check = 2;
parameter add1 = 3;parameter add2 = 4;parameter add3 = 5;parameter adi1 = 7;parameter adi2 = 8;parameter adi3 = 9;
parameter nan = 6; 
parameter lhi1 = 10; parameter lhi2 = 11; 
parameter sl1 = 12; parameter sl2 = 13; parameter sl3 = 14;
parameter sl4 = 15; parameter sl5 = 16; parameter sl6 = 17;
parameter slm =18;
parameter l1 = 19;parameter l2 = 20;parameter l3 = 21;
parameter s1 = 22;parameter s2 = 23;parameter s3 = 24;
parameter beq1 = 25;parameter beq2 = 26;parameter beq3 = 27;parameter beq4 = 28; 
parameter jalr = 29; 
parameter jal1 = 30;parameter jal2 = 31;
parameter jlr1 = 32;parameter jlr2 = 33;
parameter jump= 34;
parameter updater= 35;
parameter beqcheck=36;


output wire [5:0] curr_state;
reg [5:0] next_state = 0;

//fsm code
always @(posedge clock) begin
	case (curr_state)
		fetch1:
		begin 
			ir_write<=0;
			rf_wr_en<=0;
			mem_w_bar<=1;
			mem_en<=1;
			sh_en<=0;
			load0<=0;
			sclk<=0;
			counter_clock<=0;
			t1_control<=0;
			a1_control <= 2'b10;
			next_state <= fetch2;
		end
		
		fetch2:
		begin
			alusrcA <= 1'b1;
			address_sel <= 1'b0;
			alusrcB <=3'b000;
			alu_op <= 3'b100;
			alu_funct <= 2'b00;
			ir_write <=1;
			rf_wr_en<=0;
			mem_en <=1;
			mem_w_bar <=1;	
		   pc_en<=1;
			next_state<=fetch_check;		
		end
		fetch_check:
		begin
			ir_write<=0; rf_wr_en<=0; mem_w_bar<=1; pc_en<=0;
			if(op_code==4'b1100)begin next_state<=beq1; end
			else if(op_code == 4'b1000 || op_code== 4'b1001 ) begin next_state<=jalr; end
			else if(op_code == 4'b0000 || op_code== 4'b0010 ) begin 
		      if (CB == 2'b00) begin next_state <= add1; end
				else if (CB == 2'b10) begin 
					if(carry_flag) next_state<=add1;
					else next_state<=updater;
					end
				else if (CB == 2'b01) begin 
					if(zero_flag) next_state<=add1;
					else next_state<=updater;
					end
				else next_state<=updater;
			end
		   else if(op_code==4'b0001)begin next_state<=adi1; end
			else if(op_code==4'b0011)begin next_state<=lhi1; end
			else if(op_code == 4'b0100 || op_code== 4'b0101 ) begin next_state<=sl1; end
			else if(op_code == 4'b0110 || op_code== 4'b0111 ) begin next_state<=slm; end
			else next_state<=fetch1;
		end
		add1:
		begin 
			rf_wr_en<=0;
			t1_control<=0;
			a1_control <= 2'b00;
			a2_control <= 2'b01;
			if (op_code==4'b0010) begin next_state<= nan; end
			else if (op_code==4'b0000) begin next_state<=add2; end
		end
		add2:
		begin
			alusrcA<=1;
			alusrcB<=3'b001;
			alu_op<=3'b100;
			alu_funct<=2'b11;
			a3_control<=3'b010;
			next_state<=add3;
		end
		add3:
		begin
			rf_wr_en<=1;
			mem_w_bar<=1;
			ir_write<=0;
			rf3_control<=2'b00;
			if (a3_flag==0) begin next_state<= fetch1; end
			else begin next_state<= updater; end			
		end
		adi1:
		begin 
			ir_write<=0;
			rf_wr_en<=0;
			t1_control<=0;
			mem_w_bar<=1;
			a1_control<=2'b00;
			next_state<=adi2;
		end
		adi2:
		begin
			alusrcA<=1;
			alusrcB<=3'b010;
			alu_op<=3'b100;
			alu_funct<=2'b11;
			a3_control<=3'b001;
			next_state<=adi3;
		end
		
		adi3:
		begin
			rf_wr_en<=1;
			rf3_control<=2'b00;
			if (a3_flag==0) begin next_state<= fetch1; end
			else begin next_state<= updater; end
		end
		nan:
		begin
			alusrcA<=1;
			alusrcB<=3'b001;
			alu_op<=3'b101;
			alu_funct<=2'b00;
			a3_control<=3'b010;
			next_state<=add3;
		end
		lhi1:
		begin
			ir_write<=0;
			rf_wr_en<=0;
			mem_w_bar<=1;
			alusrcA<=0;
			alusrcB<=3'b011;
			alu_op<=3'b100;
			alu_funct<=2'b00;
			a3_control<=3'b000;
			next_state<=lhi2;			
		end
		lhi2:
		begin
			rf_wr_en<=1;
			rf3_control<=2'b00;
			if (a3_flag==0) begin next_state<= fetch1; end
			else begin next_state<= updater; end
		end	
		sl1:
		begin
			ir_write<=0;
			rf_wr_en<=0;
			mem_w_bar<=1;
			a1_control<=2'b01;
			t1_control<=0;
			next_state<=sl2;
		end
		sl2:
		begin
			alusrcA<=1;
			alusrcB<=3'b010;
			alu_op<=3'b100;
			alu_funct<=2'b11;
			if(op_code==4'b0101)next_state<=sl5;
			else if(op_code==4'b0100)next_state<=sl3;
		end
		
		sl3:
		begin
			address_sel<=1;
			a3_control<=3'b000;
			next_state<=sl4;
		end
		sl4:
		begin
			rf_wr_en<=1;
			rf3_control<=2'b01;
			if (a3_flag==0) begin next_state<= fetch1; end
			else begin next_state<= updater; end	
		end
		sl5:
		begin
			rf_wr_en<=0;
			a2_control<=2'b00;
			next_state<=sl6;
		end
		sl6:
		begin
			mem_w_bar<=0;
			address_sel<=1;
			next_state<=updater;
		end
		
		slm:
		begin
			ir_write<=0;
			rf_wr_en<=0;
			mem_w_bar<=1;
			t1_control<=0;
			a1_control<=2'b00;
			sh_en<=1;
			sclk<=1;
			load0<=1;
			counter_clock<=1;
			if (op_code==4'b0111) next_state<=s1;
			else if (op_code==4'b0110)next_state<=l1;
		end
		l1:
		begin
		   ir_write<=0;
			sclk<=0;
			load0<=0;
			counter_clock<=0;
			alusrcA<=1;
			alusrcB<={3{!sf_out}};
			alu_op<=3'b100;
			alu_funct<=2'b00;
			a3_control<=3'b011;
			address_sel<=0;
			next_state<=l2;
		end
		l2:
		begin	 
			rf_wr_en<=sf_out;
			rf3_control<=2'b01;
			t1_control<=1;
			next_state<=l3;
		end
		l3:
		begin
			counter_clock<=1;
			sh_en<=1;
			sclk<=1;
			load0<=0;
			if (c8==1&&R7_update==1) next_state<=updater;
			else if (c8==1&&R7_update==0) next_state<=fetch1;
			else if (c8==0) next_state<=l1;
		end
		s1:
		begin
			ir_write<=0;
			sclk<=0;
			load0<=0;
			counter_clock<=0;
			rf_wr_en<=0;
			a2_control<=2'b10;
			next_state<=s2;
		end
		s2:
		begin	
			address_sel<=0;
			ir_write<=0;
			mem_w_bar<=0;
			alusrcA<=1;
			alusrcB<={3{!sf_out}};
			alu_op<=3'b100;
			alu_funct<=2'b00;
			rf_wr_en<=0;
			next_state<=s3;
		end
		s3:
		begin
			counter_clock<=1;
			sh_en<=1;
			sclk<=1;
			load0<=0;
			t1_control<=1;
			if (c8==1&&a3_flag==1) next_state<=updater;
			else if (c8==1&&a3_flag==0) next_state<=fetch1;
			else if (c8==0) next_state<=s1;
		end
		beq1:
		begin
			rf_wr_en<=0;
			t1_control<=0;
			a1_control <= 2'b00;
			a2_control <= 2'b01;
			next_state<=beq2;
		end
		beq2:
		begin
			alusrcA=1;
			alusrcB=3'b001;
			alu_op=3'b010;
			alu_funct=2'b01;
			next_state=beqcheck;
		end	
		beqcheck:begin
		if(zero_flag)next_state=beq3;
			else next_state=updater;
			end
		beq3:
		begin
			a1_control<=2'b10;
			t1_control<=0;
			rf_wr_en<=0;
			next_state<=beq4;
		end
		
		beq4:
		begin
			alusrcA<=1;
			alusrcB<=3'b010;
			alu_op<=3'b100;
			alu_funct<=2'b11;
			next_state<=jump;			
		end
		jalr:
		begin
			rf_wr_en<=1;
			rf3_control<=2'b00;
			a3_control<=3'b000;
			if(op_code==4'b1001)next_state<=jlr1;
			else if(op_code==4'b1000) next_state<=jal1;
		end
		jal1:
		begin 
			a1_control<=2'b10;
			t1_control<=0;
			rf_wr_en<=0;
			next_state<=jal2;
		end
		jal2:
		begin
			alusrcA<=1;
			alusrcB<=3'b100;
			alu_op<=3'b100;
			alu_funct<=2'b00;
			next_state<=jump;
		end
		jlr1:
		begin
			rf_wr_en<=0;
			a1_control<=2'b01;
			t1_control<=0;
			next_state<=jlr2;
		end
		jlr2:
		begin
			alusrcA<=1;
			alusrcB<=3'b110;
			alu_op<=3'b100;
			alu_funct<=2'b00;
			next_state<=jump;
		end
		jump:
		begin
			rf_wr_en <= 1; mem_w_bar<=1;
		   a3_control <= 3'b100;
		   rf3_control <= 2'b00;
			next_state<=fetch1;
		end
		
		updater:
		begin
			rf_wr_en<=1;
			mem_w_bar<=1;
			ir_write<=0;
			rf3_control<=2'b10;
			a3_control<=3'b100;
			next_state<=fetch1;
		end
		default:
		begin
			next_state<=fetch1;
		end
		
	endcase
	   
end

assign curr_state = next_state;


endmodule
