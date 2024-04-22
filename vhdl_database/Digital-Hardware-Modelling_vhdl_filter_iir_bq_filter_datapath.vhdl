library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.filter_shared_package.all;

entity filter_datapath is
    generic
        (
            FPMULT_PIPE_LENGTH : P_T     := PM;
            FPADD_PIPE_LENGTH  : P_T     := PA;
            PRECISION          : natural := PREC;
            ENVELOPE_EN        : natural := ENV;            
            SETZERO_EN         : natural := SETZ            
            );

    port
        (
            -- Input ports
            clk  : in std_logic;
            rstn : in std_logic;
            aclr : in std_logic;

            x_rdaddr  : in X_ADD_T;
            x_rden    : in std_logic;
            x_wraddr  : in X_ADD_T;
            x_wren    : in std_logic;
            sink_data : in std_logic_vector(SINGLE_EXT-1 downto 0);

            coeff_rdaddr : in COEFF_ADD_T;
            coeff_rden   : in std_logic;
            coeff_wraddr : in COEFF_ADD_T;
            coeff_wren   : in std_logic;
            coeff_data   : in DATA_IO_PORT_T;

            acc_rdaddr : in ACC_ADD_T;
            acc_rden   : in std_logic;
            acc_wraddr : in ACC_ADD_T;
            acc_wren   : in std_logic;
            zero_acc   : in std_logic;

            y_rdaddr : in Y_ADD_T;
            y_rden   : in std_logic;
            y_wraddr : in Y_ADD_T;
            y_wren   : in std_logic;
            zero_y   : in std_logic;
            is_abs   : in std_logic;

            mac_x_y_sel     : in std_logic;
            mac_coeff_y_sel : in std_logic;

            -- Output ports
            source_data : out std_logic_vector(SINGLE_EXT-1 downto 0)
            );
end filter_datapath;


architecture filter_datapath_arch of filter_datapath is
    signal mac_x_in_s                    : DATA_IO_PORT_T;
    signal mac_y_in_s                    : DATA_IO_PORT_T;
    signal mac_r_out_s                   : DATA_IO_PORT_T;
    signal x_data_out_s                  : DATA_IO_PORT_T;
    signal y_data_in_s, y_data_out_s     : DATA_IO_PORT_T;
    signal acc_data_in_s, acc_data_out_s : DATA_IO_PORT_T;
    signal coeff_data_out_s              : DATA_IO_PORT_T;
    signal mac_r_reg_s                   : DATA_IO_PORT_T;
    signal mac_r_float_data_out_s        : std_logic_vector(SINGLE_EXT-1 downto 0);
    signal datapath_out_reg_s            : std_logic_vector(SINGLE_EXT-1 downto 0);
    signal sign_s : std_logic_vector(0 downto 0);
begin

    -- Filter Datapath Components
    filter_in_data_memory_inst : entity work.filter_in_data_memory
        generic map
        (
            PRECISION => PRECISION
            )

        port map
        (
            clk        => clk,
            aclr       => aclr,
            x_data_in  => sink_data,
            x_rdaddr   => x_rdaddr,
            x_rden     => x_rden,
            x_wraddr   => x_wraddr,
            x_wren     => x_wren,
            x_data_out => x_data_out_s
            );

    filter_out_data_memory_inst : entity work.device_ram_blocks
        generic map
        (
            INTENDED_DEVICE_FAMILY => "SmartFusion",
            WIDTH_AD               => y_rdaddr'length,     -- WIDTH_RDAD = WIDTH_WRAD
            WIDTH_DATA             => y_data_in_s'length,  -- WIDTH_DATAIN = WIDTH_DATAOUT
            OUP_REG                => "UNREGISTERED"       -- "UNREGISTERED" or "CLOCK0"
            )
        port map
        (
            clock     => clk,
            aclr      => aclr,
            rden      => y_rden,
            rdaddress => y_rdaddr,
            data_in   => y_data_in_s,
            wren      => y_wren,
            wraddress => y_wraddr,
            data_out  => y_data_out_s
            );

    filter_mac_mem_inst : entity work.device_ram_blocks
        generic map
        (
            INTENDED_DEVICE_FAMILY => "SmartFusion",
            WIDTH_AD               => acc_rdaddr'length,     -- WIDTH_RDAD = WIDTH_WRAD
            WIDTH_DATA             => acc_data_in_s'length,  -- WIDTH_DATAIN = WIDTH_DATAOUT
            OUP_REG                => "CLOCK0"               -- "UNREGISTERED" or "CLOCK0"
            )
        port map
        (
            clock     => clk,
            aclr      => aclr,
            rdaddress => acc_rdaddr,
            rden      => acc_rden,
            data_in   => acc_data_in_s,
            wren      => acc_wren,
            wraddress => acc_wraddr,
            data_out  => acc_data_out_s
            );

    filter_coeff_mem_inst : entity work.device_ram_blocks
        generic map
        (
            INTENDED_DEVICE_FAMILY => "SmartFusion",
            WIDTH_AD               => coeff_rdaddr'length,  -- WIDTH_RDAD = WIDTH_WRAD
            WIDTH_DATA             => coeff_data'length,    -- WIDTH_DATAIN = WIDTH_DATAOUT
            OUP_REG                => "UNREGISTERED"        -- "UNREGISTERED" or "CLOCK0"            
            )
        port map
        (
            clock     => clk,
            aclr      => aclr,
            rden      => coeff_rden,
            rdaddress => coeff_rdaddr,
            data_in   => coeff_data,
            wren      => coeff_wren,
            wraddress => coeff_wraddr,
            data_out  => coeff_data_out_s
            );

    filter_mac_datapath_inst : entity work.filter_mac_datapath
        generic map
        (
            FPMULT_PIPE_LENGTH => FPMULT_PIPE_LENGTH,
            FPADD_PIPE_LENGTH  => FPADD_PIPE_LENGTH
            )

        port map
        (
            clk => clk,
            rst => rstn,
            X   => mac_x_in_s,
            Y   => mac_y_in_s,
            A   => acc_data_out_s,
            R   => mac_r_out_s
            );

    -- register the mac output
    filter_mac_datapath_reg : process(clk, rstn)
    begin
        if(rstn = '0') then
            mac_r_reg_s <= (others => '0');
        elsif(rising_edge(clk)) then
            mac_r_reg_s <= mac_r_out_s;
        end if;
    end process filter_mac_datapath_reg;

    -- convert mac output to float type if required
    mac_sgl : if PRECISION = SINGLE_EXT generate
            mac_r_float_data_out_s <= mac_r_reg_s;
    end generate;
    
    mac_dbl: if PRECISION = DOUBLE_EXT generate
            D2F : entity work.filter_converter_dp2sp
                port map(double => mac_r_reg_s, float => mac_r_float_data_out_s);
    end generate;

-- register this mac output
datapath_reg : process(clk, rstn)
begin
    if(rstn = '0') then
        datapath_out_reg_s <= (others => '0');
    elsif(rising_edge(clk)) then
        datapath_out_reg_s <= mac_r_float_data_out_s;
    end if;
end process datapath_reg;

-- connect mac output to datapath output port
source_data <= datapath_out_reg_s;

-- Select Y input of MAC from x or y memory
env_en: if ENVELOPE_EN /= 0 generate
sign_s(0) <= y_data_out_s(PRECISION-3) and not is_abs;
with mac_x_y_sel select
    mac_y_in_s <= 	x_data_out_s when '1',
					y_data_out_s(PRECISION-1 downto PRECISION-2) & sign_s & y_data_out_s(PRECISION-4 downto 0) when others;
end generate;

env_dis: if ENVELOPE_EN = 0 generate
with mac_x_y_sel select
    mac_y_in_s <=   x_data_out_s when '1',
                    y_data_out_s when others;
end generate;    

-- Select X input of MAC from coeff or y memory
with mac_coeff_y_sel select
    mac_x_in_s <=
    coeff_data_out_s when '1',
    y_data_out_s     when others;

-- Sending zeros to Y-memory
setz_en: if SETZERO_EN /= 0 generate 
with zero_y select
    y_data_in_s <=
    mac_r_out_s     when '0',
    (others => '0') when others;
end generate;

setz_dis: if SETZERO_EN = 0 generate     
    y_data_in_s <=  mac_r_out_s;
end generate;

-- Sending zeros to Acc-memory
with zero_acc select
    acc_data_in_s <=
    mac_r_out_s     when '0',
    (others => '0') when others;

end filter_datapath_arch;

