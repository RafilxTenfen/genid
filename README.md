# GenID
- Handle for ID's
- Generate ID's
- Convert from base62 to UUID
- Convert from UUID to base62

### How to Use
- Build with Docker
```shell
$~ docker build -t gen .
```

- Run the binary
```shell
$~ docker run gen:latest ./genid --help
```

- It should print all the flags available

- Generate 3 ID's
```shell
$~ docker run gen:latest ./genid -c 3
```

- Convert from base62 to UUID
```shell
$~ docker run gen:latest ./genid -s 6TxH1ZE9oNEoxWWqUv9ho4
```

- Convert from UUID to base62
```shell
$~ docker run gen:latest ./genid -b d5042d58-55ad-45b3-ac8b-d343b3dbcb54
```

### Troubles
- The first time running `make` it will generate the `rules.mk` file, just run `make` again and everything should workout
