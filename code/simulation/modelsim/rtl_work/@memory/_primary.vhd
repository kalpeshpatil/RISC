library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        In_Mem_Access_en: in     vl_logic;
        In_Mem_Access_R_Wbar: in     vl_logic;
        In_Mem_Access_addr: in     vl_logic_vector(15 downto 0);
        In_Mem_Write_data: in     vl_logic_vector(15 downto 0);
        Out_Mem_Read_data: out    vl_logic_vector(15 downto 0);
        In_clock        : in     vl_logic;
        In_reset        : in     vl_logic;
        mem_21          : out    vl_logic_vector(15 downto 0);
        mem_22          : out    vl_logic_vector(15 downto 0);
        mem_23          : out    vl_logic_vector(15 downto 0);
        mem_24          : out    vl_logic_vector(15 downto 0);
        mem_25          : out    vl_logic_vector(15 downto 0);
        mem_26          : out    vl_logic_vector(15 downto 0)
    );
end Memory;
