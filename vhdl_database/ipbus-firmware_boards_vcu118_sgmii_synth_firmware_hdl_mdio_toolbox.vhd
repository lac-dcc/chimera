library IEEE;
use IEEE.STD_LOGIC_1164.all;


package mdio_toolbox_package is

    -- encode a MDIO write sequence: see Xiling PG047 (Gigabit Ethernet PCS/PMA IP) under "MDIO management interface" (page 42 of the 4 Oct 2017 version)
    -- note that it has to be transmitted from MSB to LSB
    function encode_mdio_reg_write(phyad : std_logic_vector(4 downto 0);
                                   regad : std_logic_vector(4 downto 0);
                                   data  : std_logic_vector(15 downto 0))
        return std_logic_vector;


    -- encode a MDIO read sequence: see Xiling PG047 (Gigabit Ethernet PCS/PMA IP) under "MDIO management interface" (page 42 of the 4 Oct 2017 version)
    -- note that it has to be transmitted from MSB to LSB
    -- see mask below for which bits to send
    function encode_mdio_reg_read(phyad : std_logic_vector(4 downto 0);
                                  regad : std_logic_vector(4 downto 0))
        return std_logic_vector;

    function mdio_reg_read_mask return std_logic_vector;

    --- encode an extended register write (see data sheet of TI DP83867, section 8.6.12 "Extended Register Addressing" )
    -- note that it has to be transmitted from MSB to LSB
    function encode_mdio_extreg_write(phyad  : std_logic_vector(4 downto 0);
                                      extreg : std_logic_vector(15 downto 0);
                                      data   : std_logic_vector(15 downto 0))
        return std_logic_vector;

end package mdio_toolbox_package;

package body mdio_toolbox_package is

    -- encode a MDIO write sequence: see Xiling PG047 (Gigabit Ethernet PCS/PMA IP) under "MDIO management interface" (page 42 of the 4 Oct 2017 version)
    -- note that it has to be transmitted from MSB to LSB
    function encode_mdio_reg_write(phyad : std_logic_vector(4 downto 0);
                                   regad : std_logic_vector(4 downto 0);
                                   data  : std_logic_vector(15 downto 0))
        return std_logic_vector is
    begin
        return x"FFFF_FFFF" & b"01" & b"01" & phyad & regad & b"10" & data;
    end;

    -- encode a MDIO read sequence: see Xiling PG047 (Gigabit Ethernet PCS/PMA IP) under "MDIO management interface" (page 42 of the 4 Oct 2017 version)
    -- note that it has to be transmitted from MSB to LSB
    -- see mask below for which bits to send
    function encode_mdio_reg_read(phyad : std_logic_vector(4 downto 0);
                                  regad : std_logic_vector(4 downto 0))
        return std_logic_vector is
    begin
        return x"FFFF_FFFF" & b"01" & b"10" & phyad & regad & b"00" & x"0000";
    end;
    -- returns a mask, aligned with the one from encode_mdio_reg_read, where '1' means write to PHY, '0' means read from PHY
    function mdio_reg_read_mask return std_logic_vector is
    begin
        return x"FFFF_FFFF" & b"11" & b"11" & b"11111" & b"11111" & b"00" & x"0000";
    end;

    --- encode an extended register write (see data sheet of TI DP83867, section 8.6.12 "Extended Register Addressing" )
    -- note that it has to be transmitted from MSB to LSB
    function encode_mdio_extreg_write(phyad  : std_logic_vector(4 downto 0);
                                      extreg : std_logic_vector(15 downto 0);
                                      data   : std_logic_vector(15 downto 0))
        return std_logic_vector is
        constant MDIO_REG_0xD     : std_logic_vector(4 downto 0)  := b"01101";
        constant MDIO_REG_0xE     : std_logic_vector(4 downto 0)  := b"01110";
        constant MDIO_WRITE_ADDR  : std_logic_vector(15 downto 0) := b"00_000000000_11111";
        constant MDIO_WRITE_VALUE : std_logic_vector(15 downto 0) := b"01_000000000_11111";
    begin
        return encode_mdio_reg_write(phyad, MDIO_REG_0xD, MDIO_WRITE_ADDR) &
            encode_mdio_reg_write(phyad, MDIO_REG_0xE, extreg) &
            encode_mdio_reg_write(phyad, MDIO_REG_0xD, MDIO_WRITE_VALUE) &
            encode_mdio_reg_write(phyad, MDIO_REG_0xE, data);
    end;

end package body mdio_toolbox_package;  -- mdio_toolbox_package 
