-- Library Clause(s) (optional)
-- Use Clause(s) (optional)
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.filter_shared_package.all;

entity filter_in_data_memory is
    generic
        (
            PRECISION : natural := PREC
            );

    port
        (
            -- Input ports
            clk, aclr : in std_logic;
            x_data_in : in std_logic_vector(SINGLE_EXT-1 downto 0);
            x_rdaddr  : in X_ADD_T;
            x_rden    : in std_logic;
            x_wraddr  : in X_ADD_T;
            x_wren    : in std_logic;

            -- Output ports
            x_data_out : out DATA_IO_PORT_T
            );
end filter_in_data_memory;

architecture filter_in_data_memory_arch of filter_in_data_memory is

    component filter_converter_sp2dp is
        port
            (
                float  : in  std_logic_vector(SINGLE_EXT-1 downto 0);
                double : out std_logic_vector(DOUBLE_EXT-1 downto 0)
                );
    end component;

    signal float_data_s : std_logic_vector(SINGLE_EXT-1 downto 0);

begin

    -- Instance of X-Memory
    filter_in_data_memory_inst : entity work.device_ram_blocks
        generic map
        (
            INTENDED_DEVICE_FAMILY => "SmartFusion",
            WIDTH_AD               => x_rdaddr'length,   -- WIDTH_RDAD = WIDTH_WRAD
            WIDTH_DATA             => x_data_in'length,  -- WIDTH_DATAIN = WIDTH_DATAOUT
            OUP_REG                => "UNREGISTERED"     -- "UNREGISTERED" or "CLOCK0"            
            )
        port map
        (
            clock     => clk,
            aclr      => aclr,
            rden      => x_rden,
            rdaddress => x_rdaddr,
            data_in   => x_data_in,
            wren      => x_wren,
            wraddress => x_wraddr,
            data_out  => float_data_s
            );        

    -- Output is either float type or double type
    SNGL: if PRECISION = SINGLE_EXT generate
            x_data_out <= float_data_s;
    end generate;
    
    DBL: if PRECISION = DOUBLE_EXT generate
        F2D : component filter_converter_sp2dp
            port map(float => float_data_s, double => x_data_out);
    end generate;
end filter_in_data_memory_arch;