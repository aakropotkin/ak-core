
/* Explicitly a symbol in the scope of a library */
CREATE TABLE LIBSYMBOLS(
    LIBSYMID    INTEGER  PRIMARY KEY AUTOINCREMENT,
    /* Usually `sym.<REALNAME>' */
    FLAGNAME    TEXT     UNIQUE,
    /* Demangled name */
    NAME        TEXT     NOT NULL,
    /* Mangled name */
    REALNAME    TEXT     NOT NULL,
    /* Index in symtab */
    ORDINAL     INTEGER  UNIQUE,
    /* Global, Local, Weak, LoProc, HiProc */
    BIND        TEXT,
    /* NoType, Object, Func, Section, File, LoProc, HiProc */
    TYPE        TEXT,
    /* C, C++ */
    LANG        TEXT,
    /* 0 ( False ), 1 ( True ) */
    IMPORTED    NUMERIC,
    LIBID       INTEGER NOT NULL
  );


CREATE TABLE LIBRARY(
    LIBID        INTEGER PRIMARY KEY AUTOINCREMENT,
    /* Filesystem Name */
    FSNAME       TEXT,
    SONAME       TEXT,
    /* List of TEXT */
    SYMLINKS     JSON,
    REL_VERSION  TEXT,
    ABI_VERSION  TEXT,
    /* x86, aarch, ... */
    ARCH         TEXT,
    /* Base Address */
    BADDR        INTEGER,
    /* Size of the binary */
    SIZE         INTEGER,
    /* ELF, ??? */
    BTYPE        TEXT,
    /* 32, 64 */
    BITS         INTEGER,
    /* No idea */
    CANARY       NUMERIC,
    /* ELF32, ELF64 */
    CLASS        TEXT,
    /* GCC: (GNU) 10.3.0, ... */
    COMPILER     TEXT,
    /* ??? */
    CRYPTO       NUMERIC,
    /* Debug info file */
    DEBUGFILE    TEXT,
    /* 0 ( Little ), 1 ( BIG ) */
    BIG_ENDIAN   NUMERIC,
    /* 0 ( False ), 1 ( Has Debug sources ) */
    HAVECODE     NUMERIC,
    /* Logical Address */
    LADDR        INTEGER,
    /* C, C++, ... */
    LANG         TEXT,
    /* 0 ( False ), 1 ( Has Debug line numbers ) */
    LINENUM      NUMERIC,
    /* ?? */
    LSYMS        NUMERIC,
    /* AMD x86-64 architecture, ... */
    MACHINE      TEXT,
    /* ?? */
    NX           NUMERIC,
    /* linux, ... */
    OS           TEXT,
    /* 0 ( False ), 1 ( True ) */
    PIC          NUMERIC,
    /* 0 ( False ), 1 ( True ) */
    RELOCS       NUMERIC,
    /* "Relocations Read Only" ::= partial, ... */
    RELRO        TEXT,
    /* `:' separated list of paths */
    RPATH        TEXT,
    /* 0 ( False ), 1 ( True ) */
    SANITIZED    NUMERIC,
    /* 0 ( False ), 1 ( True ) */
    STATIC       NUMERIC,
    /* 0 ( False ), 1 ( True ) */
    STRIPPED     NUMERIC,
    /* linux, ... */
    SUBSYSTEM    TEXT,
    /* ??? 0 ( False ), 1 ( True ) */
    VA           NUMERIC,
    /* For shared/static library pairs, the other lib */
    OTHERLIBID   INTEGER,
    /* Foreign key for member of a package */
    PKGID        INTEGER
  );
