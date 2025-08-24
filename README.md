# Division in x86 Assembly (16-bit ÷ 8-bit)

This program demonstrates how to divide a 16-bit number by an 8-bit number in x86 Assembly, and how to clearly separate the quotient and remainder when debugging.

---

## Process Explanation

1. **Loading the Numbers**  
   The dividend (for example, 7510) is loaded into the 16-bit register `AX`.  
   The divisor (for example, 75) is loaded into the 8-bit register `BL`.

2. **Performing the Division**  
   The `div bl` instruction divides the 16-bit value in `AX` by the 8-bit value in `BL`.  
   - The **quotient** is stored in the `AL` register (lower 8 bits of AX).  
   - The **remainder** is stored in the `AH` register (upper 8 bits of AX).

3. **Why Separation is Needed**  
   After division, both quotient and remainder are inside the same register pair (`AX`), just split across `AL` and `AH`.  
   This can look confusing in a debugger, because `AX` will show a combined value of both parts.

4. **Separating Quotient and Remainder**  
   To avoid confusion:  
   - The remainder from `AH` is copied into another register (like `CL`).  
   - Then `AH` is cleared, so that `AX` only shows the quotient.  

   This way:  
   - `AX` (or just `AL`) holds the **quotient**.  
   - `CL` holds the **remainder**.  

5. **Checking Values in GDB**  
   In **GDB**, you can view the results after the `div` instruction:  
   - Run `p $al` to see the **quotient**.  
   - Run `p $ah` to see the **remainder**.  

   After the separation step:  
   - `p $ax` will show only the quotient.  
   - `p $cl` will show the remainder.

6. **Numerical Example**  
   For the given numbers:  
   - Dividend = 7510  
   - Divisor = 75  
   - Quotient = 100  
   - Remainder = 10  

   So in GDB:  
   - `p $al` would give `100`.  
   - `p $ah` would give `10`.  
   - After separation, `p $ax = 100` and `p $cl = 10`.

---

## Key Takeaways

- `div bl` divides the 16-bit register `AX` by the 8-bit register `BL`.  
- Quotient is placed in `AL`, remainder in `AH`.  
- Use `p $al` and `p $ah` in GDB to check them directly.  
- Moving the remainder into another register and clearing `AH` makes the values easier to inspect and use.  

