----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:40 10/31/2017 
-- Design Name: 
-- Module Name:    principal - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity principal is
    Port ( CLK : in  STD_LOGIC;
           SIN : in  STD_LOGIC;
           AN : out  STD_LOGIC_VECTOR (3 downto 0);
           SEG7 : out  STD_LOGIC_VECTOR (6 downto 0));
end principal;

architecture Behavioral of principal is

constant UMBRAL1 : STD_LOGIC_VECTOR (5 downto 0) := "100010"; -- 34
constant UMBRAL2 : STD_LOGIC_VECTOR (5 downto 0) := "100110"; -- 38

signal CLK_M: STD_LOGIC;
signal REG40: STD_LOGIC_VECTOR (39 downto 0);
signal SUM: STD_LOGIC_VECTOR (5 downto 0);
signal COMP1_MOORE: STD_LOGIC;
signal COMP1_AND: STD_LOGIC;
signal COMP2_AND: STD_LOGIC;
signal AND_AUX: STD_LOGIC;
signal SIN_REG: STD_LOGIC;
signal EN_REG: STD_LOGIC;
signal EN_VALID: STD_LOGIC;
signal REG_DESPL: STD_LOGIC_VECTOR (13 downto 0);
signal REG_VALID: STD_LOGIC_VECTOR (13 downto 0);


component gen_reloj
	Port ( CLK : in STD_LOGIC; -- Reloj de la FPGA
		CLK_OUT : out STD_LOGIC); -- Reloj de frecuencia dividida
end component;

component reg_desp40
	Port ( SIN : in STD_LOGIC; -- Datos de entrada serie
		CLK : in STD_LOGIC; -- Reloj de muestreo
	Q : out STD_LOGIC_VECTOR (39 downto 0)); -- Salida paralelo
end component;

component sumador40
	Port ( ENT : in STD_LOGIC_VECTOR (39 downto 0);
		SAL : out STD_LOGIC_VECTOR (5 downto 0));
end component;

component comparador
	Port ( P : in STD_LOGIC_VECTOR (5 downto 0);
	Q : in STD_LOGIC_VECTOR (5 downto 0);
	PGTQ : out STD_LOGIC;
	PLEQ : out STD_LOGIC);
end component;

component AND_2
	Port ( A : in STD_LOGIC;
		B : in STD_LOGIC;
		S : out STD_LOGIC);
end component;

component reg_desp
	Port ( SIN : in STD_LOGIC; -- Datos de entrada serie
		CLK : in STD_LOGIC; -- Reloj
		EN : in STD_LOGIC; -- Enable
		Q : out STD_LOGIC_VECTOR (13 downto 0)); -- Salida paralelo
end component;

component registro
	Port ( ENTRADA : in STD_LOGIC_VECTOR (13 downto 0);
		SALIDA : out STD_LOGIC_VECTOR (13 downto 0);
		EN : in STD_LOGIC; -- Enable
		CLK : in STD_LOGIC);
end component;

component automata
	Port ( CLK : in STD_LOGIC; -- Reloj del autómata
		C0 : in STD_LOGIC; -- Condición de decision para "0"
		C1 : in STD_LOGIC; -- Condición de decisión para "1"
		DATO : out STD_LOGIC; -- Datos a cargar
		CAPTUR : out STD_LOGIC; -- Enable del reg. de desplaz.
		VALID : out STD_LOGIC); -- Activación registro
end component;

component visualizacion
	Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 0
		E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 1
		E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 2
		E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 3
		CLK : in STD_LOGIC; -- Entrada de reloj FPGA
		SEG7 : out STD_LOGIC_VECTOR (6 downto 0); -- Salida para los displays
		AN : out STD_LOGIC_VECTOR (3 downto 0)); -- Activación individual
end component;

begin
	U1: gen_reloj port map(
	CLK=>CLK,
	CLK_OUT=>CLK_M
	);
	
	U2: reg_desp40 port map(
	CLK=>CLK_M,
	SIN=>SIN,
	Q=>REG40
	);
	
	U3: sumador40 port map(
	ENT=>REG40,
	SAL=>SUM
	);
	
	U4: comparador port map(
	P=>SUM,
	Q=>UMBRAL1,
	PGTQ=>COMP1_AND,
	PLEQ=>COMP1_MOORE
	);
	
	U5: comparador port map(
	P=>SUM,
	Q=>UMBRAL2,
	PLEQ=>COMP2_AND
	);
	
	U6: AND_2 port map(
	A=>COMP1_AND,
	B=>COMP2_AND,
	S=>AND_AUX
	);
	
	U7: automata port map(
	CLK=>CLK_M,
	C0=>AND_AUX,
	C1=>COMP1_MOORE,
	DATO=>SIN_REG,
	CAPTUR=>EN_REG,
	VALID=>EN_VALID
	);
	
	U8: reg_desp port map(
	SIN=>SIN_REG,
	CLK=>CLK_M,
	EN=>EN_REG,
	Q=>REG_DESPL
	);
	
	U9: registro port map(
	ENTRADA=>REG_DESPL,
	SALIDA=>REG_VALID,
	EN=>EN_VALID,
	CLK=>CLK_M
	);
	
	U10: visualizacion port map(
	E3(0)=>REG_VALID(0),
	E3(1)=>REG_VALID(1),
	E3(2)=>REG_VALID(2),
	E3(3)=>REG_VALID(3),
	E2(0)=>REG_VALID(4),
	E2(1)=>REG_VALID(5),
	E2(2)=>REG_VALID(6),
	E2(3)=>REG_VALID(7),
	E1(0)=>REG_VALID(8),
	E1(1)=>REG_VALID(9),
	E1(2)=>REG_VALID(10),
	E1(3)=>REG_VALID(11),
	E0(0)=>REG_VALID(12),
	E0(1)=>REG_VALID(13),
	E0(2)=>'0',
	E0(3)=>'0',
	CLK=>CLK,
	SEG7=>SEG7,
	AN=>AN
	);
	


end Behavioral;

