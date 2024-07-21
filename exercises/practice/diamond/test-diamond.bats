#!/usr/bin/env bats
# generated on 2024-07-19T12:25:40Z
load bats-extra
load bats-jq

@test "Degenerate case with a single 'A' row" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip

    run jq -r -f diamond.jq << 'END_INPUT'
        {
          "letter": "A"
        }
END_INPUT

    assert_success
    expected='A'
    assert_equal "$output" "$expected"
}

@test 'Degenerate case with no row containing 3 distinct groups of spaces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    run jq -r -f diamond.jq << 'END_INPUT'
        {
          "letter": "B"
        }
END_INPUT

    assert_success
    expected=$(cat << END_EXPECTED
.A.
B.B
.A.
END_EXPECTED
)
    assert_equal "$output" "$expected"
}

@test 'Smallest non-degenerate case with odd diamond side length' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    run jq -r -f diamond.jq << 'END_INPUT'
        {
          "letter": "C"
        }
END_INPUT

    assert_success
    expected=$(cat << END_EXPECTED
..A..
.B.B.
C...C
.B.B.
..A..
END_EXPECTED
)
    assert_equal "$output" "$expected"
}

@test 'Smallest non-degenerate case with even diamond side length' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    run jq -r -f diamond.jq << 'END_INPUT'
        {
          "letter": "D"
        }
END_INPUT

    assert_success
    expected=$(cat << END_EXPECTED
...A...
..B.B..
.C...C.
D.....D
.C...C.
..B.B..
...A...
END_EXPECTED
)
    assert_equal "$output" "$expected"
}

@test 'Largest possible diamond' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip

    run jq -r -f diamond.jq << 'END_INPUT'
        {
          "letter": "Z"
        }
END_INPUT

    assert_success
    expected=$(cat << END_EXPECTED
.........................A.........................
........................B.B........................
.......................C...C.......................
......................D.....D......................
.....................E.......E.....................
....................F.........F....................
...................G...........G...................
..................H.............H..................
.................I...............I.................
................J.................J................
...............K...................K...............
..............L.....................L..............
.............M.......................M.............
............N.........................N............
...........O...........................O...........
..........P.............................P..........
.........Q...............................Q.........
........R.................................R........
.......S...................................S.......
......T.....................................T......
.....U.......................................U.....
....V.........................................V....
...W...........................................W...
..X.............................................X..
.Y...............................................Y.
Z.................................................Z
.Y...............................................Y.
..X.............................................X..
...W...........................................W...
....V.........................................V....
.....U.......................................U.....
......T.....................................T......
.......S...................................S.......
........R.................................R........
.........Q...............................Q.........
..........P.............................P..........
...........O...........................O...........
............N.........................N............
.............M.......................M.............
..............L.....................L..............
...............K...................K...............
................J.................J................
.................I...............I.................
..................H.............H..................
...................G...........G...................
....................F.........F....................
.....................E.......E.....................
......................D.....D......................
.......................C...C.......................
........................B.B........................
.........................A.........................
END_EXPECTED
)
    assert_equal "$output" "$expected"
}
