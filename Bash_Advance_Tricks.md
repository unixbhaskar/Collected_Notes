# Bash Advance Tricks and Tips

<details>
<summary>Debug Mechanism </summary>
# Step 1:

 **In the .bashrc file**
```bash
export PS4='# ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]}() -
[${SHLVL},${BASH_SUBSHELL},$?] '
```
# Step 2:

   `set -o xtrace` .....inside the script

# Step 3:

      Use `pstree`    ...command to find out the process hierarchy

# step 4:

   Use some predefined variables for safety check ..

   - `set -o errexit`

   - `set -o nounset`

   - `set -o pipefail`

   - `set -o nullglob`


# Some useful print statement
```bash
print() {
  echo $(basename $0):${BASH_LINENO[0]}:${FUNCNAME[1]}"()" "$*"
}
```

# Testing numeric value
```bash
$user_inputed_numeric_value =~ ^[0-9]*$

```
</details>

<details>
<summary>UpperCase</summary>

`bash_uppercase=what_the_heck`

`printf "%s\n" ${bash_uppercase^^}`
</details>

<details>
<summary>Lowercase</summary>

`bash_lowercase=REALLY`

`printf "%s\n" ${bash_lowercase,,}`
</details>

<details>
<summary>Array Index Iteration</summary>

```bash
lang_array=(C Java Bash Assembly)

for (( i = 0; ${#lang_array[@]}; i++ )); do
  echo $i "="  ${lang_array[$i]}
done
```
</details>

<details>
<summary>Array without index</summary>

```bash
lang_array=(C Java Bash Assembly)

for lang in ${lang_array[@]}; do
  echo $lang
done
```
</details>

<details>
<summary>Array with specific index</summary>

```bash
lang_array=(C Java Bash Assembly)

for lang in ${lang_array[@]:1}; do
  echo $lang "(skipped the first one)"
done
```
</details>

<details>
<summary>Array specific number element</summary>

```bash
lang_array=(C Java Bash Assembly)

for lang in ${lang_array[@]:1:3}; do
  echo $lang "(skipped the first and last ones)"
done
```
</details>

<details>
<summary>Array of files</summary>

```bash
tarballs=($(ls /my/dir/*.tar.gz))

```
</details>

<details>
<summary>All about map</summary>
```bash
declare -A map_example
map_example=(
  ["first_name"]="Donald"
  ["last_name"]="Knuth"
)

for el in ${!map_example[@]}; do
  echo $el":" ${map_example[$el]}
done
```
</details>

<details>
<summary>Start and End with uppercase and lowercase letter </summary>

```bash
 VAR='holy kow'
  echo "${VAR^}"

 VAR='HOLY KOW'
 echo "${VAR,}"

```
</details>

<details>
<summary>Make specific character uppercase </summary>

```bash
VAR='mastsr mind'
 echo "${VAR^^s}"

```
</details>

<details>
<summary>Make specific character lowercase </summary>

```bash
VAR='MSMSMS PHPHPH'
 echo "${VAR,,M}"

```
</details>

<details>
<summary>With Regex </summary>

```bash
VAR='SOSOSO CRCRCR'
 echo "${VAR,,[CR]}"

```
</details>

<details>
<summary>Case match inside loops </summary>

```bash
 VAR='tell'
if [ "${VAR^^}" == "TELL" ];then
echo 'Matched!'
else
echo 'Not Matched!'
fi
```

```bash
 VAR='fall'
 if [[ "${VAR^^a}" == *"a"* ]];then
 echo 'Matched!'
 else
 echo 'Not Matched!'
 fi
```
</details>

<details>
<summary>Call Trace </summary>

```bash
function print_call_trace()
{
  # skipping i=0 as this is print_call_trace itself
  for ((i = 1; i < ${#FUNCNAME[@]}; i++)); do
    echo -n  ${BASH_SOURCE[$i]}:${BASH_LINENO[$i-1]}:${FUNCNAME[$i]}"(): "
    sed -n "${BASH_LINENO[$i-1]}p" $0
  done
}
```
</details>

<details>
<summary>Browse internet by bash </summary>
```bash

 exec 3<>/dev/tcp/www.wikipedia.org/80
  netstat -anpt | grep 80 | grep bash
  cat <&3
```
</details>



<details>
<summary>References</summary>

<http://skybert.net/bash/serious-programming-in-bash/>

<https://steve-parker.org/sh/bourne.shtml>

<http://cfajohnson.com/shell/>
</details>
