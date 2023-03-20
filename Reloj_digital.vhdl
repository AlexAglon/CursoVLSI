library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity reldig is
port(
    reloj: in std__logic;
    AN: out std_logic_vector (3 downto 0);
    L : out std_logic_vector (6 downto 0);
);
end reldig;

architecture bhv of reldig is
    signal segundo : std__logic;
    signal rapido : std__logic;
    signal n : std__logic;
    signal Qs : std__logic_vector (3 downto 0);
    signal Qum : std__logic_vector (3 downto 0);
    signal Qdm : std__logic_vector (3 downto 0);
    signal e : std__logic;
    signal Qr : std__logic_vector (1 downto 0);
    signal Quh : std__logic_vector (3 downto 0);
    signal Qdh : std__logic_vector (3 downto 0);
    signal z : std__logic;
    signal u : std__logic;
    signal d : std__logic;
    signal reset : std__logic;

begin
    divisor : process(reloj)
        variable CUENTA : STD_LOGIC_VECTOR(27 downto 0) := X"00000000";
    begin
        if rising_edge(reloj) then
            if CUENTA= X"48009EO" then
                CUENTA := X"0000000";
            else
            CUENTA := CUENTA +1;
            end if;
        end if;
        segundo <= CUENTA(22);
        rapido <= CUENTA(10);
    end process;

    UNIDADES: process (segundo)
        variable CUENTA: STD_LOGIC_VECTOR (3 downto 0) := "0000";
    begin
        if rising_edge (segundo) then
            if CUENTA = "1001" then
                CUENTA := "0000";
            else 
                CUENTA := CUENTA+1;
                N <= '0';
            end if;
        end if;
        Qum<=CUENTA;
    end process;

    DECENAS : process(N)
        variable CUENTA:= STD_LOGIC_VECTOR (3 downto 0) := "0000";
    begin
        if rising_edge (N) then
            if CUENTA = "0101" then
                CUENTA:= "0000";
                E <= '1';
            else
                CUENTA := CUENTA+1;
                E<='0';
            end if;
            Qdm <= CUENTA;
    end process;

    
