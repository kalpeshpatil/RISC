library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        shEn            : in     vl_logic;
        sclk            : in     vl_logic;
        \in\            : in     vl_logic_vector(8 downto 0);
        sF              : out    vl_logic;
        SF_update       : out    vl_logic
    );
end shifter;
