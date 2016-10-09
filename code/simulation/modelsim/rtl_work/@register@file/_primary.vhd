library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        In_RF_Read_addr1: in     vl_logic_vector(2 downto 0);
        In_RF_Read_addr2: in     vl_logic_vector(2 downto 0);
        Out_RF_Read_data1: out    vl_logic_vector(15 downto 0);
        Out_RF_Read_data2: out    vl_logic_vector(15 downto 0);
        In_RF_Write_addr1: in     vl_logic_vector(2 downto 0);
        In_RF_Write_data1: in     vl_logic_vector(15 downto 0);
        In_RF_Write_en_1: in     vl_logic;
        In_clock        : in     vl_logic;
        In_reset        : in     vl_logic;
        reg_0           : out    vl_logic_vector(15 downto 0);
        reg_1           : out    vl_logic_vector(15 downto 0);
        reg_2           : out    vl_logic_vector(15 downto 0);
        reg_3           : out    vl_logic_vector(15 downto 0);
        reg_4           : out    vl_logic_vector(15 downto 0);
        reg_5           : out    vl_logic_vector(15 downto 0);
        reg_6           : out    vl_logic_vector(15 downto 0);
        reg_7           : out    vl_logic_vector(15 downto 0)
    );
end RegisterFile;
