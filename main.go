package main

import (
	"encoding/hex"
	"flag"
	"fmt"

	"github.com/google/uuid"

	null "github.com/rhizomplatform/pg-null"
)

func main() {
	total := flag.Int("c", 0, "Number of IDs to generate")
	tostr := flag.String("s", "", "Base62 UUID to convert to the standard notation")
	tob62 := flag.String("b", "", "Standard UUID to convert to the base62 notation")
	flag.Parse()

	if *tostr != "" || *tob62 != "" {
		if *tostr != "" {
			uid, err := null.ParseID(*tostr)
			if err != nil {
				panic(err)
			}

			fmt.Printf("%-38s >>> Default >>>   %s\n", *tostr, uid)
		}

		if *tob62 != "" {
			v, err := uuid.Parse(*tob62)
			if err != nil {
				panic(err)
			}

			uid := null.UUID{UUID: v, Valid: true}
			fmt.Printf("%-38s >>> Base 62 >>>   %s\n", *tob62, uid.Base62())
		}

		fmt.Println()
	}

	if *total == 0 {
		return
	}

	fmt.Printf("%-40s %-25s %s\n", "UUID", "Base62", "Hex")
	fmt.Printf("%-40s %-25s %s\n", "----------", "----------", "----------")

	for i := 0; i < *total; i++ {
		id := null.NewID()
		b, err := id.UUID.MarshalBinary()
		if err != nil {
			panic(err)
		}

		fmt.Printf("%-40s %-25s %s\n", id.String(), id.Base62(), hex.EncodeToString(b))
	}
}
