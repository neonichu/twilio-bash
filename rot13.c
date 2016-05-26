#include <stdio.h>
#include <string.h>
#include <ctype.h>

void foo(char* word) {
    int key = 13;

    for (int n = 0, len = strlen(word); n < len; n++)
    {
        int currentLetter = word[n];

        if (isalpha(currentLetter) == 0) {
            printf("%c", currentLetter);
            continue;
        }

        char cipher = currentLetter + key;

        int offset = 'a';
        if (currentLetter < offset) { offset = 'A'; }

        if ((currentLetter - offset) + key > 26) {
            key = ((currentLetter - offset) + key) % 26;
            cipher = offset + key;
        }

        printf("%c", cipher);

        key = 13;
    }

    printf("\n");   
}

int main(int argc, char** argv)
{
    foo("Hello, World!"); // Output: Uryyb, Jbeyq!
    foo("SIGNAL"); // Output: YOMTGR
    foo("Welcome to $bash!"); // Output: ???
    return 0;
}