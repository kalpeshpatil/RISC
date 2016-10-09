library verilog;
use verilog.vl_types.all;
entity register_3b is
    port(
        \in\            : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0);
        flag            : out    vl_logic;
        clock           : in     vl_logic
    );
end register_3b;
