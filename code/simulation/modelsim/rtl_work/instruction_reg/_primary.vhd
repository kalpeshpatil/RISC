library verilog;
use verilog.vl_types.all;
entity instruction_reg is
    port(
        op_code         : out    vl_logic_vector(3 downto 0);
        ir_in           : in     vl_logic_vector(15 downto 0);
        ir1             : out    vl_logic_vector(2 downto 0);
        ir2             : out    vl_logic_vector(2 downto 0);
        ir3             : out    vl_logic_vector(2 downto 0);
        imm6            : out    vl_logic_vector(5 downto 0);
        imm9            : out    vl_logic_vector(8 downto 0);
        CB              : out    vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        ir_write        : in     vl_logic
    );
end instruction_reg;
