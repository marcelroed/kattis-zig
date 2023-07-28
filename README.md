# Zig Kattis Setup

## Zig solutions
The `different_solutions/` directory contains solutions for [different](https://open.kattis.com/problems/different) that cover the possible failure modes of Kattis submissions (`Accepted`, `CompileError`, `MemoryLimitExceeded`, `OutputLimitExceeded`, `RuntimeError`, `TimeLimitExceeded`, `WrongAnswer`).

## Downloading and installing Zig
### Zig Setup
Zig can be downloaded from the [Zig website](https://ziglang.org/download/).

### Dockerfile
The repository includes a Dockerfile that sets up a Zig environment.
The only dependencies that are installed are to download and extract the Zig compiler.


## Compiling and running standalone Zig programs

### Compile
Compiling with Zig is done with the `zig build-exe` command.
The following command:

```bash
$ zig build-exe -O ReleaseSafe -femit-bin=./a [filename].zig
```
will compile the Zig file `[filename].zig` to a binary named `a`.

#### Compiler Flags
Zig has four optimization levels, set with the `-O` argument.

```
Debug         No optimizations,         safety enabled
ReleaseFast   Optimize for performance, safety disabled
ReleaseSafe   Optimize for performance, safety enabled
ReleaseSmall  Optimize for binary size, safety disabled
```

One can also set debug information, for instance enabling error traces in ReleaseFast mode with `-ferror-tracing`.
Here is a current list, generated with `zig build-exe --help`:
```
Compile Options:
  -target [name]            <arch><sub>-<os>-<abi> see the targets command
  -mcpu [cpu]               Specify target CPU and feature set
  -mcmodel=[default|tiny|   Limit range of code and data virtual addresses
            small|kernel|
            medium|large]
  -x language               Treat subsequent input files as having type <language>
  -mred-zone                Force-enable the "red-zone"
  -mno-red-zone             Force-disable the "red-zone"
  -fomit-frame-pointer      Omit the stack frame pointer
  -fno-omit-frame-pointer   Store the stack frame pointer
  -mexec-model=[value]      (WASI) Execution model
  --name [name]             Override root name (not a file path)
  -O [mode]                 Choose what to optimize for
    Debug                   (default) Optimizations off, safety on
    ReleaseFast             Optimize for performance, safety off
    ReleaseSafe             Optimize for performance, safety on
    ReleaseSmall            Optimize for small binary, safety off
  --mod [name]:[deps]:[src] Make a module available for dependency under the given name
      deps: [dep],[dep],...
      dep:  [[import=]name]
  --deps [dep],[dep],...    Set dependency names for the root package
      dep:  [[import=]name]
  --main-pkg-path           Set the directory of the root package
  -fPIC                     Force-enable Position Independent Code
  -fno-PIC                  Force-disable Position Independent Code
  -fPIE                     Force-enable Position Independent Executable
  -fno-PIE                  Force-disable Position Independent Executable
  -flto                     Force-enable Link Time Optimization (requires LLVM extensions)
  -fno-lto                  Force-disable Link Time Optimization
  -fstack-check             Enable stack probing in unsafe builds
  -fno-stack-check          Disable stack probing in safe builds
  -fstack-protector         Enable stack protection in unsafe builds
  -fno-stack-protector      Disable stack protection in safe builds
  -fsanitize-c              Enable C undefined behavior detection in unsafe builds
  -fno-sanitize-c           Disable C undefined behavior detection in safe builds
  -fvalgrind                Include valgrind client requests in release builds
  -fno-valgrind             Omit valgrind client requests in debug builds
  -fsanitize-thread         Enable Thread Sanitizer
  -fno-sanitize-thread      Disable Thread Sanitizer
  -fdll-export-fns          Mark exported functions as DLL exports (Windows)
  -fno-dll-export-fns       Force-disable marking exported functions as DLL exports
  -funwind-tables           Always produce unwind table entries for all functions
  -fno-unwind-tables        Never produce unwind table entries
  -fLLVM                    Force using LLVM as the codegen backend
  -fno-LLVM                 Prevent using LLVM as the codegen backend
  -flibLLVM                 Force using the LLVM API in the codegen backend
  -fno-libLLVM              Prevent using the LLVM API in the codegen backend
  -fClang                   Force using Clang as the C/C++ compilation backend
  -fno-Clang                Prevent using Clang as the C/C++ compilation backend
  -freference-trace[=num]   How many lines of reference trace should be shown per compile error
  -fno-reference-trace      Disable reference trace
  -ferror-tracing           Enable error tracing in ReleaseFast mode
  -fno-error-tracing        Disable error tracing in Debug and ReleaseSafe mode
  -fsingle-threaded         Code assumes there is only one thread
  -fno-single-threaded      Code may not assume there is only one thread
  -fbuiltin                 Enable implicit builtin knowledge of functions
  -fno-builtin              Disable implicit builtin knowledge of functions
  -ffunction-sections       Places each function in a separate section
  -fno-function-sections    All functions go into same section
  -fstrip                   Omit debug symbols
  -fno-strip                Keep debug symbols
  -fformatted-panics        Enable formatted safety panics
  -fno-formatted-panics     Disable formatted safety panics
  -ofmt=[mode]              Override target object format
    elf                     Executable and Linking Format
    c                       C source code
    wasm                    WebAssembly
    coff                    Common Object File Format (Windows)
    macho                   macOS relocatables
    spirv                   Standard, Portable Intermediate Representation V (SPIR-V)
    plan9                   Plan 9 from Bell Labs object format
    hex  (planned feature)  Intel IHEX
    raw  (planned feature)  Dump machine code directly
  -idirafter [dir]          Add directory to AFTER include search path
  -isystem  [dir]           Add directory to SYSTEM include search path
  -I[dir]                   Add directory to include search path
  -D[macro]=[value]         Define C [macro] to [value] (1 if [value] omitted)
  --libc [file]             Provide a file which specifies libc paths
  -cflags [flags] --        Set extra flags for the next positional C source files
```