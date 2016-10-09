module counter_3b (load_0,c8, counter_clock, counter_op);
input wire counter_clock;
input wire load_0;
output  [2:0] counter_op;
output reg c8;
reg [2:0] tmp; 



 //load_0 should be made low as soon as it is made high (very next state)
always @(posedge counter_clock) 
    begin 
      if (load_0)
		begin
        tmp = 3'b000; 
		  c8 <= 0;
		 end
      else 
		begin
        tmp = tmp + 1'b1; 
		  if (tmp == 3'b111) 
			  begin 
			  c8 <= 1'b1;
			  end
		end
    end 
assign counter_op = tmp; 
endmodule
