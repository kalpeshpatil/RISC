library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        add             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        addW            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        nan             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        nanW            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        comp            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        compW           : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0)
    );
    port(
        In_ALU_opcode   : in     vl_logic_vector(2 downto 0);
        In_ALU_funct    : in     vl_logic_vector(1 downto 0);
        In_ALU_srcA_data: in     vl_logic_vector(15 downto 0);
        In_ALU_srcB_data: in     vl_logic_vector(15 downto 0);
        Out_ALU_CFlag   : out    vl_logic;
        Out_ALU_ZFlag   : out    vl_logic;
        Out_ALU_Write_en: out    vl_logic;
        Out_ALU_result  : out    vl_logic_vector(15 downto 0);
        In_clock        : in     vl_logic;
        In_reset        : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of add : constant is 1;
    attribute mti_svvh_generic_type of addW : constant is 1;
    attribute mti_svvh_generic_type of nan : constant is 1;
    attribute mti_svvh_generic_type of nanW : constant is 1;
    attribute mti_svvh_generic_type of comp : constant is 1;
    attribute mti_svvh_generic_type of compW : constant is 1;
end ALU;
