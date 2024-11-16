# FPGA-RAM

This VHDL design defines a **4-bit RAM module** using **D Flip-Flops**. The design leverages modularity by defining a reusable D Flip-Flop component and then using it to create the RAM module. The RAM operates synchronously with a clock signal and provides basic memory storage functionality.

---

### 1. **D Flip-Flop Component**
The **D Flip-Flop** is the fundamental building block of the RAM. It is defined as a reusable component with the following details:

#### **Entity (`D_flipflop`)**
- **Inputs**:
  - `D`: Data input (single bit).
  - `clk`: Clock signal for synchronizing operations.
  - `rst`: Reset signal to clear the output.
- **Output**:
  - `Q`: Output signal (stores the current state of the flip-flop).

#### **Architecture**
- **Reset Behavior**:
  - When the `rst` signal is active (`rst = '0'`), the output `Q` is reset to `'0'`.
- **Clock Behavior**:
  - On the rising edge of the clock (`clk`), the input value `D` is latched into the output `Q`.

This process makes the D Flip-Flop a sequential memory element capable of storing one bit of data.

---

### 2. **RAM Module**
The **RAM module** combines 4 D Flip-Flops to create a 4-bit memory unit.

#### **Entity (`RAM`)**
- **Inputs**:
  - `D`: A 4-bit data input vector (`std_logic_vector(3 downto 0)`), representing the data to be written to the memory.
  - `clk`: Clock signal for synchronizing operations.
  - `rst`: Reset signal to clear the RAM contents.
- **Output**:
  - `Q`: A 4-bit output vector (`std_logic_vector(3 downto 0)`), representing the stored data.

#### **Architecture**
- The architecture instantiates 4 instances of the `D_flipflop` component, labeled as `R0`, `R1`, `R2`, and `R3`.
- Each flip-flop is connected to one bit of the input vector `D` and produces one bit of the output vector `Q`.
- All flip-flops share the same clock (`clk`) and reset (`rst`) signals, ensuring synchronous operation.

---

### 3. **How It Works**
1. **Reset**:
   - When the `rst` signal is active (`rst = '0'`), all D Flip-Flops are reset, clearing the RAM contents. The output `Q` is set to `0000`.
   
2. **Write Operation**:
   - On the rising edge of the clock signal (`clk`), the 4-bit input vector `D` is written to the RAM by updating the states of the flip-flops.

3. **Output**:
   - The stored 4-bit data is continuously available on the `Q` output vector until the RAM is reset or a new value is written on the next clock cycle.

---

### 4. **Applications**
- This design can be used to understand the fundamentals of digital memory design.
- It demonstrates the use of modular components in VHDL.
- The implementation can be extended to create larger RAMs or more complex memory structures.

---

### 5. **Key Features**
- **Modularity**: Reuses the `D_flipflop` component to simplify the design and allow for scalability.
- **Synchronous Operation**: All operations (write and reset) are synchronized with the clock signal.
- **Reset Capability**: Ensures the RAM contents can be cleared to a known state.
- **Scalability**: The design can be expanded to support larger data widths by instantiating additional flip-flops.

This implementation is ideal for small-scale memory demonstrations in FPGA or digital systems and provides a foundation for learning about memory design in VHDL.

https://www.youtube.com/watch?v=4Ic-3D_aC1U
