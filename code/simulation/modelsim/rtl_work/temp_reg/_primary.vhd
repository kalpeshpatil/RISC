library verilog;
use verilog.vl_types.all;
entity temp_reg is
    port(
        temp_ip         : in     vl_logic_vector(15 downto 0);
        temp_op         : out    vl_logic_vector(15 downto 0);
        temp_clk        : in     vl_logic
    );
end temp_reg;
