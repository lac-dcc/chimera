library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.T80_Pack.all;

entity z80a is
    port(
        RESET_n         : in std_logic;
        CLKM_n          : in std_logic;
        CLKE_n          : in std_logic;
        WAIT_n          : in std_logic;
        INT_n           : in std_logic;
        NMI_n           : in std_logic;
        BUSRQ_n         : in std_logic;
        M1_n            : out std_logic;
        MREQ_n          : out std_logic;
        IORQ_n          : out std_logic;
        RD_n            : out std_logic;
        WR_n            : out std_logic;
        RFSH_n          : out std_logic;
        HALT_n          : out std_logic;
        BUSAK_n         : out std_logic;
        A               : out std_logic_vector(15 downto 0);
        D               : inout std_logic_vector(7 downto 0)
    );
end z80a;

architecture rtl of z80a is

    signal ADDRESS_zs           : std_logic;
    signal DO                   : std_logic_vector(7 downto 0);
    signal DATA_zs              : std_logic;
    signal MREQ_n_i             : std_logic;
    signal MREQ_zs              : std_logic;
    signal IORQ_n_i             : std_logic;
    signal IORQ_zs              : std_logic;
    signal RD_n_i               : std_logic;
    signal RD_zs                : std_logic;
    signal WR_n_i               : std_logic;
    signal WD_zs                : std_logic;

begin

    A <= A_i when ADDRESS_zs = '0' else (others => 'Z');
    D <= DO when DATA_zs = '0' else (others => 'Z');
    MREQ_n <= MREQ_n_i when MREQ_zs = '0' else 'Z';
    IORQ_n <= IORQ_n_i when IORQ_zs = '0' else 'Z';
    RD_n <= RD_n_i when RD_zs = '0' else 'Z';
    WR_n <= WR_n_i when WR_zs = '0' else 'Z';

    u0 : work.z80cpu
        port map(
            MCLK => CLKM_n,
            CLK => CLKE_n,
            ADDRESS => A_i,
            ADDRESS_z => ADDRESS_zs,
            DATA_i => DI_Reg,
            DATA_o => DO,
            DATA_z => DATA_zs,
            M1 => M1_n,
            MREQ => MREQ_n_i,
            MREQ_z => MREQ_zs,
            IORQ => IORQ_n_i,
            IORQ_z => IORQ_zs,
            RD => RD_n_i,
            RD_z => RD_zs,
            WR => WR_n_i,
            WR_z => WR_zs,
            RFSH => RFSH_n
            HALT => HALT_n,
            WAIT => WAIT_n,
            INT => INT_n,
            NMI => NMI_n,
            RESET => RESET_n,
            BUSRQ => BUSRQ_n,
            BUSAK => BUSAK_n,
);


end;
