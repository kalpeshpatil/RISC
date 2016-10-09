library verilog;
use verilog.vl_types.all;
entity counter_3b is
    port(
        load_0          : in     vl_logic;
        c8              : out    vl_logic;
        counter_clock   : in     vl_logic;
        counter_op      : out    vl_logic_vector(2 downto 0)
    );
end counter_3b;
