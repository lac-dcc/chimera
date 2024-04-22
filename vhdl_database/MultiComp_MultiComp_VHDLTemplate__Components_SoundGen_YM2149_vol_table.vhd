-- generated with tablegen by MikeJ
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vol_table is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(9 downto 0)
    );
end;

architecture RTL of vol_table is

  function romgen_str2slv (str : string) return std_logic_vector is
    variable result : std_logic_vector (str'length*4-1 downto 0);
  begin
    for i in 0 to str'length-1 loop
      case str(str'high-i) is
        when '0'       => result(i*4+3 downto i*4) := x"0";
        when '1'       => result(i*4+3 downto i*4) := x"1";
        when '2'       => result(i*4+3 downto i*4) := x"2";
        when '3'       => result(i*4+3 downto i*4) := x"3";
        when '4'       => result(i*4+3 downto i*4) := x"4";
        when '5'       => result(i*4+3 downto i*4) := x"5";
        when '6'       => result(i*4+3 downto i*4) := x"6";
        when '7'       => result(i*4+3 downto i*4) := x"7";
        when '8'       => result(i*4+3 downto i*4) := x"8";
        when '9'       => result(i*4+3 downto i*4) := x"9";
        when 'A'       => result(i*4+3 downto i*4) := x"A";
        when 'B'       => result(i*4+3 downto i*4) := x"B";
        when 'C'       => result(i*4+3 downto i*4) := x"C";
        when 'D'       => result(i*4+3 downto i*4) := x"D";
        when 'E'       => result(i*4+3 downto i*4) := x"E";
        when 'F'       => result(i*4+3 downto i*4) := x"F";
        when others => result(i*4+3 downto i*4) := "XXXX";
      end case;
    end loop;
    return result;
  end romgen_str2slv;

  attribute INIT_00 : string;
  attribute INIT_01 : string;
  attribute INIT_02 : string;
  attribute INIT_03 : string;
  attribute INIT_04 : string;
  attribute INIT_05 : string;
  attribute INIT_06 : string;
  attribute INIT_07 : string;
  attribute INIT_08 : string;
  attribute INIT_09 : string;
  attribute INIT_0A : string;
  attribute INIT_0B : string;
  attribute INIT_0C : string;
  attribute INIT_0D : string;
  attribute INIT_0E : string;
  attribute INIT_0F : string;

  component RAMB4_S1
    --pragma translate_off
    generic (
      INIT_00 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_01 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_02 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_03 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_04 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_05 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_06 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_07 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_08 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_09 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0A : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0B : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0C : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0D : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0E : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0F : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000"
      );
    --pragma translate_on
    port (
      DO    : out std_logic_vector (0 downto 0);
      DI    : in  std_logic_vector (0 downto 0);
      ADDR  : in  std_logic_vector (11 downto 0);
      WE    : in  std_logic;
      EN    : in  std_logic;
      RST   : in  std_logic;
      CLK   : in  std_logic
      );
  end component;

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(11 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "A3FF3C09E03755DF43AF510A88509D3598CB92F0A961B34BDC9EB90EBC9EF9B0";
    attribute INIT_01 of inst : label is "D800C6FA0A6395DFAAAF531A6C54157058DB73B4696057CE5C971A5E7C9F388A";
    attribute INIT_02 of inst : label is "6000F915F5986A225C1A2F6F9791E7BDA38FA4709571EB63AD8EC58E9C9EC7B0";
    attribute INIT_03 of inst : label is "1C00040D089C9222A41A4F6F179107B5238B047415602B4A6C97654E1C9F478A";
    attribute INIT_04 of inst : label is "EFFFF40DE8C91B07B42FCB10946EB44AA074A38B8A9F84B5EB68DAB19B60F875";
    attribute INIT_05 of inst : label is "0FFF65D647760C68995AF46E23D44B7042F05F8F359F6BB51C6866716C600075";
    attribute INIT_06 of inst : label is "C800CD56163C1C07D4247FF7249045B027F0448F0D9F67B520687C7254641470";
    attribute INIT_07 of inst : label is "B4007DFAD1438123C92447EF04947DEB47EE65F07DD0626A45972E8D759B150F";
    attribute INIT_08 of inst : label is "4000A1A97389B7E38F201AD0BD60DAB2F5F7B690DBA085CEC0118091B190F08D";
    attribute INIT_09 of inst : label is "3C0036FBD8C6C6582120D59571170ECC45107108681076AE715127114210460C";
    attribute INIT_0A of inst : label is "9400428534F9414305C03FDEE7E0BF0CCE379E1782AF84D2852FE5EDB4F8D0EC";
    attribute INIT_0B of inst : label is "13FF36867E392B873398F6B6FF37BAECDDA8812187CEAE13A9A0F722D637B253";
    attribute INIT_0C of inst : label is "24005466854A113B09F36379249B3DA22B9B4C385D743EE536C7403C7B891E9B";
    attribute INIT_0D of inst : label is "240059E7958A37B44F343F3A3D395F2550FB40F97FFB3EFB06FB790444B963FB";
    attribute INIT_0E of inst : label is "98006ADC7A14CD09F2890774ECAA9486CB4AC4B5865DE475DAA9E570A3829879";
    attribute INIT_0F of inst : label is "BFFF4000BFFFA000A000A000A3FFA3FFA3FFA3FFA3FFA3FFA3FFA3FFA3FFA3FF";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(0 downto 0),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom1 : if true generate
    attribute INIT_00 of inst : label is "6000872EB8D53E8A305A5340563544CF31412DCA42242A045945633A5945238A";
    attribute INIT_01 of inst : label is "47FFBA234D6A417567A5AEBFCDCABB358EBEB275FDDA95FAA6B29DC5E6BADD45";
    attribute INIT_02 of inst : label is "DFFFBCD9470DD4AACC4AFD25A1B4A647D245C9CA9634C224F845A7BA9945E58A";
    attribute INIT_03 of inst : label is "BC00472EB0F6BB5593B542DA5E4B59B02DBE363569DA3DFA46B278C566BA1A45";
    attribute INIT_04 of inst : label is "A00048D1AF1D448A6C5A394A222525FA51CA4DBE0345694F3DDA22741DDA6230";
    attribute INIT_05 of inst : label is "5FFFA727786BA8E2B50ACD2441B56ECA134A11BA7645024F29DA463479DA6230";
    attribute INIT_06 of inst : label is "67FFFF27C929788A7C51CD4AC24AE5B591B58E45C1BA89B0B625C1CAD625E9CA";
    attribute INIT_07 of inst : label is "D3FF8F230F95E6556AAEF2A5FDB5E25AAE5A91B5CE4AB3DA89B2BE47C9BED645";
    attribute INIT_08 of inst : label is "A8006F71EFE2176AEB5574757AD5584A224A7FB5745A4E7A31B40E4B31B54E47";
    attribute INIT_09 of inst : label is "F4009EDCA914E972FB55C1354AB53C7962B5594217B57FA5410B6EB4304A0FB9";
    attribute INIT_0A of inst : label is "840016A63AEDCC6AB76A588B6B550B7944B51B4A59A5238A1D5A62A75C5D07A6";
    attribute INIT_0B of inst : label is "EFFFCB58AC12E5EA610DB52B60555D6630DD73AA3564428A7CD50BAA15552E8A";
    attribute INIT_0C of inst : label is "00003C38572CC2EDCDE57E9295F28A14BE0D9A2DDA69E717D0EA99D6A61DB8F2";
    attribute INIT_0D of inst : label is "97FF2C475353AF665F19DB139EEDBCE983EDF3EDB3ED8C128BEDF2E9F412CFED";
    attribute INIT_0E of inst : label is "E800E060F4581E5190AE25D8128C05570E2C756648D135262E8D0BD90953112E";
    attribute INIT_0F of inst : label is "80003FFF7FFF6000600060006000600060006000600060006000600060006000";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(1 downto 1),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom2 : if true generate
    attribute INIT_00 of inst : label is "1FFF714F62A6C55386D3982CA919D329A8D2D8D3A5099AD6C729E413F8D6DB6C";
    attribute INIT_01 of inst : label is "3FFF7443D233FBD99689C96CBB2C97E69993D519A72CB0D39E648729E193F8D6";
    attribute INIT_02 of inst : label is "3FFF7661DA51FA8CB52CCBF6F7668ED69529E72CCEE6A50998D69F6C8729E093";
    attribute INIT_03 of inst : label is "7C00CEB09D58BE26F96676D356D22899476C2EE658D3672C219B18D61E6C0529";
    attribute INIT_04 of inst : label is "6000C99E8DAE05536AD3302C0909732C68D31893252958D6672C651978D31AE6";
    attribute INIT_05 of inst : label is "C0009147223352CC042C0BF7B766C6D3952CF76CAED6A52998D3DEE6E72CE519";
    attribute INIT_06 of inst : label is "DFFFB6B85D8EFD53BAD9F42CC92CB366E8999929E76CD899EEF6A72CB10998D3";
    attribute INIT_07 of inst : label is "B0004943A2599A26517706893499492C06D36899192C2AD32764192958934ED6";
    attribute INIT_08 of inst : label is "5800A941424C8A33D1D9052631266ED3092C696616D3192C289926D217665929";
    attribute INIT_09 of inst : label is "AC003860C5A75DDCDE26BB990E99352E3699502C6966168917D23966292C2691";
    attribute INIT_0A of inst : label is "13FF083834B19E3355CCBD5391D98E2E8A99AE2CD176F6ACEBD38976952E9688";
    attribute INIT_0B of inst : label is "C800AF60685C0E4C72515673DDD9C23782AEFE73C5C88F53B2A6B18CA5D98F53";
    attribute INIT_0C of inst : label is "6400EF40E8B0784E76464FA36E5C645824517B8E043123A6334C3A581C5104A3";
    attribute INIT_0D of inst : label is "2BFF4887A09CE4B8475E88A3284E284E544E2BB1144E185C1BB16BB16FA3644E";
    attribute INIT_0E of inst : label is "5400AE806A9F5161E1CF409FC1CFBB67CEB0BB47B19E84B88E318F618F639F4F";
    attribute INIT_0F of inst : label is "8000000000001FFF1FFF1FFF1FFF1FFF1FFF1FFF1FFF1FFF1FFF1FFF1FFF1FFF";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(2 downto 2),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom3 : if true generate
    attribute INIT_00 of inst : label is "F3FFB78FE5C7C09C026364B0CB5EE34EF463AB9C8CB19667D34EF35CEB98E8B0";
    attribute INIT_01 of inst : label is "F3FFB683C543C49E023174B0CB4FA347D423A35E8CB09C639247934EF3DCEB98";
    attribute INIT_02 of inst : label is "F3FFB681C561C5CF00B074B8C347B267DCB1B34FADB88CB19467934F934EF3DC";
    attribute INIT_03 of inst : label is "F00086C08760854704B8FD9C626334214CB072472B9C0CB00C231467124F134E";
    attribute INIT_04 of inst : label is "EC0080E097303F63959CBB4F34B13CB04B9C5423734E2B980CB00CA114631647";
    attribute INIT_05 of inst : label is "CC00C8781ABC3A70FF4F8B473CB80D9C234F5CB07267734E6B9C2DB80CB00CA1";
    attribute INIT_06 of inst : label is "CC00C93F38CF389CFA6180B00B4F434734212B4E4CB054217247734F634E6B9C";
    attribute INIT_07 of inst : label is "83FF7F836561454744B87DCEC021F4B0CD9CB421AB4F899C8CB894B1D423D267";
    attribute INIT_08 of inst : label is "3400207EDA8FBABC3B6180B83B470A6334B04B475D9C54B07421726363472B4E";
    attribute INIT_09 of inst : label is "6FFFCE80A7380760C547FB21F5DEBF4FC2219B4FB4B8A231A3638B478B4F8DDE";
    attribute INIT_0A of inst : label is "BC000EC0963E86BCCF70F89C7B610AB075DE4AB01B473DCF349C34B820B02230";
    attribute INIT_0B of inst : label is "6BFF9180BE9F668F2A9E3143B89EC547FA308543808F8A9CBA38BB30BF61B563";
    attribute INIT_0C of inst : label is "80005D800EC051706978E6C3269F5960669E3D3039411AC70A8F029F069E063C";
    attribute INIT_0D of inst : label is "FBFF9AF8811FCAC056601EC35E8F2170768F5D3E4970416042C122C126C3268F";
    attribute INIT_0E of inst : label is "080074FF58E0DD81BEF0CAE02EF011875F3F6E786EE06AC060C161816183718F";
    attribute INIT_0F of inst : label is "800040003C00D7FFABFFA000BBFFBBFFBBFFBBFFBBFFBBFFBBFFBBFFBBFFBBFF";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(3 downto 3),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom4 : if true generate
    attribute INIT_00 of inst : label is "9400220F52F8B2E00F7C8D3F799F0E703283391F3D3E2F786E704E6046E046C0";
    attribute INIT_01 of inst : label is "94002303727CB2E00F3E8D3F798F4E7812C3319F3D3F2D7C2F782E704EE046E0";
    attribute INIT_02 of inst : label is "94002301727EB2F00D3F8D3F71874F7812C1318F3D3F3D3E2D782E702E704EE0";
    attribute INIT_03 of inst : label is "97FF1300327FF2780D3F8D1FF083CD3E82C0B087B91FBD3FBD3CAD78AF70AE70";
    attribute INIT_04 of inst : label is "87FF1500323F727C0D1FC98FB2C1CD3F86E092C3B18FB91FBD3FBD3EAD7CAF78";
    attribute INIT_05 of inst : label is "A7FF1580B73F777F0D8FF987B2C0FD1FCE7092C0B087B18FB91FBD3FBD3FBD3E";
    attribute INIT_06 of inst : label is "A7FF15C0B50F751F0881F2C08670F187CD3EC67082C092C1B087B18FB18FB91F";
    attribute INIT_07 of inst : label is "EBFF95FCAD814D87B2C072F08D3EF2C0FD1FCD3EC670C6E0C2C0D2C192C39087";
    attribute INIT_08 of inst : label is "6800CA7F88F008C0F67E0D3F4987077C32C079876D1F6D3F4D3E4F7C4E784670";
    attribute INIT_09 of inst : label is "7800EB00D23FB27FCD8709C172E04D8F0F3E167032C030C131833987398F3D1F";
    attribute INIT_0A of inst : label is "17FF14FF3CC0CCC0327FF51F8981873FF2E0F8C0E987CD0FCD1FCD3FCD3FCF3F";
    attribute INIT_0B of inst : label is "43FF9A002B1F530FE8E0027CF51FB27888C08D838D0F871FB73FB63FB27EB27C";
    attribute INIT_0C of inst : label is "37FF2600EB0085802A7FD303ECE0B580931F8A3F8A7E88F888F088E08CE08CC0";
    attribute INIT_0D of inst : label is "33FF5CFF9A1FEB00FC7F4B0334F01580430F4A3F4A7F4A7F48FE68FE6CFC6CF0";
    attribute INIT_0E of inst : label is "F000B700DCFFC60124FF6B0054FF45F80BC02B802B002B002B012A012A033A0F";
    attribute INIT_0F of inst : label is "DFFFC000300097FF83FF87FF9C009C009C009C009C009C009C009C009C009C00";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(4 downto 4),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom5 : if true generate
    attribute INIT_00 of inst : label is "B800140FB4FFF4FF847F79C0021F047F34FC3DE039C03B807B807B807B007B00";
    attribute INIT_01 of inst : label is "B8001403B47FF4FF843F79C0020F047F14FC35E039C039803B803B807B007B00";
    attribute INIT_02 of inst : label is "B8001401B47FF4FF863F79C00A07047F14FE35F039C039C039803B803B807B00";
    attribute INIT_03 of inst : label is "B8003400F47FF47F863F79E00B03063F04FF34F83DE039C039C039803B803B80";
    attribute INIT_04 of inst : label is "A8003600F43F747F861F7DF04B01063F04FF14FC35F03DE039C039C039803B80";
    attribute INIT_05 of inst : label is "A8003600F43F747F860F7DF84B00061F047F14FF34F835F03DE039C039C039C0";
    attribute INIT_06 of inst : label is "A8003600F60F761F830174FF7B800A07063F047F04FF14FE34F835F035F03DE0";
    attribute INIT_07 of inst : label is "AC003600E60146078B00F4FF79C00B00061F063F047F04FF04FF14FE14FC14F8";
    attribute INIT_08 of inst : label is "2FFF2380C30003008B80863FFDF8FB80CB008207861F863F863F847F847F847F";
    attribute INIT_09 of inst : label is "2FFF23FFCBC00B80B9F88201F4FFF9F0FBC0EB80CB00CB01CA03C207C20FC61F";
    attribute INIT_0A of inst : label is "47FFC8FF08FF38FF747F89E08201843FF4FFFCFFFDF8F9F0F9E0F9C0F9C0FBC0";
    attribute INIT_0B of inst : label is "13FF4C001C1FB40F6300747F89E08B8083008603860F841FB43FB43FB47FB47F";
    attribute INIT_0C of inst : label is "5800D7FF23FFC9FF9C7F4BFC67007600741F7C3F7C7F7CFF7CFF7CFF78FF78FF";
    attribute INIT_0D of inst : label is "A3FF0F00B3E023FF487F43FC77007600340F3C3F3C7F3C7F3CFF1CFF18FF18FF";
    attribute INIT_0E of inst : label is "9FFF58000F00F7FEE8FFA3FFB700B600BC009C009C009C009C019C019C038C0F";
    attribute INIT_0F of inst : label is "DFFFA0005FFF87FFAC00A800B000B000B000B000B000B000B000B000B000B000";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(5 downto 5),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom6 : if true generate
    attribute INIT_00 of inst : label is "9FFF180F18FFE700E87F91FF93E09780A700AE00AE00AC00EC00EC00EC00EC00";
    attribute INIT_01 of inst : label is "9FFF1803187FE700E83F91FF93F097808700A600AE00AE00AC00AC00EC00EC00";
    attribute INIT_02 of inst : label is "9FFF1801187FE700E83F91FF93F897808700A600AE00AE00AE00AC00AC00EC00";
    attribute INIT_03 of inst : label is "9FFF1800187FE780E83F91FF93FC97C09700A700AE00AE00AE00AE00AC00AC00";
    attribute INIT_04 of inst : label is "8FFF1800183F6780E81F91FF93FE97C097008700A600AE00AE00AE00AE00AC00";
    attribute INIT_05 of inst : label is "8FFF1800183F6780E80F91FF93FF97E097808700A700A600AE00AE00AE00AE00";
    attribute INIT_06 of inst : label is "8FFF1800180F67E0EC0198FF93FF93F897C0978097008700A700A600A600AE00";
    attribute INIT_07 of inst : label is "8FFF1800080157F8EC0098FF91FF93FF97E097C0978097009700870087008700";
    attribute INIT_08 of inst : label is "0FFF0C002C0013FFEC00E83F91FF93FF93FF93F897E097C097C0978097809780";
    attribute INIT_09 of inst : label is "0FFF0C002C0013FFEE00EC0198FF91FF93FF93FF93FF93FE93FC93F893F097E0";
    attribute INIT_0A of inst : label is "27FF2F00EF0010FF6780EE00EC01E83F98FF90FF91FF91FF91FF91FF91FF93FF";
    attribute INIT_0B of inst : label is "23FF2FFFEFE0180F73FF6780EE00EC00EC00E803E80FE81FD83FD83FD87FD87F";
    attribute INIT_0C of inst : label is "200027FFF3FF2E00107F53FF77FF67FF67E06FC06F806F006F006F006F006F00";
    attribute INIT_0D of inst : label is "7C00D0009C00F3FFAF80AC0098009800980F903F907F907F90FF90FF90FF90FF";
    attribute INIT_0E of inst : label is "A0002000D00027FF0F000C00180018001000100010001000100110011003100F";
    attribute INIT_0F of inst : label is "9FFF40002000A7FF8FFF8FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(6 downto 6),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom7 : if true generate
    attribute INIT_00 of inst : label is "20005FF0A0FF47FF4F805E005C00580078007000700070003000300030003000";
    attribute INIT_01 of inst : label is "20005FFCA07F47FF4FC05E005C00580058007800700070007000700030003000";
    attribute INIT_02 of inst : label is "20005FFEA07F47FF4FC05E005C00580058007800700070007000700070003000";
    attribute INIT_03 of inst : label is "20005FFFA07F47FF4FC05E005C00580058007800700070007000700070007000";
    attribute INIT_04 of inst : label is "30005FFFA03FC7FF4FE05E005C00580058005800780070007000700070007000";
    attribute INIT_05 of inst : label is "30005FFFA03FC7FF4FF05E005C00580058005800780078007000700070007000";
    attribute INIT_06 of inst : label is "30005FFFA00FC7FF4FFE5F005C005C0058005800580058007800780078007000";
    attribute INIT_07 of inst : label is "30005FFFB001E7FF4FFF5F005E005C0058005800580058005800580058005800";
    attribute INIT_08 of inst : label is "B0004FFFB000A3FF4FFF4FC05E005C005C005C00580058005800580058005800";
    attribute INIT_09 of inst : label is "B0004FFFB000A3FF4FFF4FFE5F005E005C005C005C005C005C005C005C005800";
    attribute INIT_0A of inst : label is "B8004FFFB000A0FFC7FF4FFF4FFE4FC05F005F005E005E005E005E005E005C00";
    attribute INIT_0B of inst : label is "BC004FFFB000A00FC3FFC7FF4FFF4FFF4FFF4FFC4FF04FE05FC05FC05F805F80";
    attribute INIT_0C of inst : label is "BFFF47FFBC00B000A07FE3FFC7FFC7FFC7FFCFFFCFFFCFFFCFFFCFFFCFFFCFFF";
    attribute INIT_0D of inst : label is "BFFF6000DFFFBC00B000B000A000A000A00FA03FA07FA07FA0FFA0FFA0FFA0FF";
    attribute INIT_0E of inst : label is "C000BFFF600047FF4FFF4FFF5FFF5FFF5FFF5FFF5FFF5FFF5FFE5FFE5FFC5FF0";
    attribute INIT_0F of inst : label is "E0008000BFFF3800300030002000200020002000200020002000200020002000";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(7 downto 7),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom8 : if true generate
    attribute INIT_00 of inst : label is "C0009FFF3F007800700060006000600040004000400040004000400040004000";
    attribute INIT_01 of inst : label is "C0009FFF3F807800700060006000600060004000400040004000400040004000";
    attribute INIT_02 of inst : label is "C0009FFF3F807800700060006000600060004000400040004000400040004000";
    attribute INIT_03 of inst : label is "C0009FFF3F807800700060006000600060004000400040004000400040004000";
    attribute INIT_04 of inst : label is "C0009FFF3FC07800700060006000600060006000400040004000400040004000";
    attribute INIT_05 of inst : label is "C0009FFF3FC07800700060006000600060006000400040004000400040004000";
    attribute INIT_06 of inst : label is "C0009FFF3FF07800700060006000600060006000600060004000400040004000";
    attribute INIT_07 of inst : label is "C0009FFF3FFE7800700060006000600060006000600060006000600060006000";
    attribute INIT_08 of inst : label is "C0008FFF3FFF3C00700070006000600060006000600060006000600060006000";
    attribute INIT_09 of inst : label is "C0008FFF3FFF3C00700070006000600060006000600060006000600060006000";
    attribute INIT_0A of inst : label is "C0008FFF3FFF3F00780070007000700060006000600060006000600060006000";
    attribute INIT_0B of inst : label is "C0008FFF3FFF3FF07C0078007000700070007000700070006000600060006000";
    attribute INIT_0C of inst : label is "C00087FF3FFF3FFF3F807C007800780078007000700070007000700070007000";
    attribute INIT_0D of inst : label is "C00080001FFF3FFF3FFF3FFF3FFF3FFF3FF03FC03F803F803F003F003F003F00";
    attribute INIT_0E of inst : label is "FFFFC000800087FF8FFF8FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF9FFF";
    attribute INIT_0F of inst : label is "FFFFFFFFC000C000C000C000C000C000C000C000C000C000C000C000C000C000";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(8 downto 8),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
  rom9 : if true generate
    attribute INIT_00 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_01 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_02 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_03 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_04 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_05 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_06 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_07 of inst : label is "FFFFE000C0008000800080008000800080008000800080008000800080008000";
    attribute INIT_08 of inst : label is "FFFFF000C000C000800080008000800080008000800080008000800080008000";
    attribute INIT_09 of inst : label is "FFFFF000C000C000800080008000800080008000800080008000800080008000";
    attribute INIT_0A of inst : label is "FFFFF000C000C000800080008000800080008000800080008000800080008000";
    attribute INIT_0B of inst : label is "FFFFF000C000C000800080008000800080008000800080008000800080008000";
    attribute INIT_0C of inst : label is "FFFFF800C000C000C00080008000800080008000800080008000800080008000";
    attribute INIT_0D of inst : label is "FFFFFFFFE000C000C000C000C000C000C000C000C000C000C000C000C000C000";
    attribute INIT_0E of inst : label is "FFFFFFFFFFFFF800F000F000E000E000E000E000E000E000E000E000E000E000";
    attribute INIT_0F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
  begin
    inst : ramb4_s1
      --pragma translate_off
      generic map (
        INIT_00 => romgen_str2slv(inst'INIT_00),
        INIT_01 => romgen_str2slv(inst'INIT_01),
        INIT_02 => romgen_str2slv(inst'INIT_02),
        INIT_03 => romgen_str2slv(inst'INIT_03),
        INIT_04 => romgen_str2slv(inst'INIT_04),
        INIT_05 => romgen_str2slv(inst'INIT_05),
        INIT_06 => romgen_str2slv(inst'INIT_06),
        INIT_07 => romgen_str2slv(inst'INIT_07),
        INIT_08 => romgen_str2slv(inst'INIT_08),
        INIT_09 => romgen_str2slv(inst'INIT_09),
        INIT_0A => romgen_str2slv(inst'INIT_0A),
        INIT_0B => romgen_str2slv(inst'INIT_0B),
        INIT_0C => romgen_str2slv(inst'INIT_0C),
        INIT_0D => romgen_str2slv(inst'INIT_0D),
        INIT_0E => romgen_str2slv(inst'INIT_0E),
        INIT_0F => romgen_str2slv(inst'INIT_0F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(9 downto 9),
        DI   => "0",
        ADDR => rom_addr,
        WE   => '0',
        EN   => '1',
        RST  => '0',
        CLK  => CLK
        );
  end generate;
end RTL;
