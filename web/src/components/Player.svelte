<script lang="ts">
  export let serverId: number;
  export let name: string;

  // Colourise method from CFX Chat
  function colouriseName(str: string): string {
    str = escape(str);
    let s = "<span>" + colorTrans(str) + "</span>";

    const styleDict: { [key: string]: string } = {
      "*": "font-weight: bold;",
      _: "text-decoration: underline;",
      "~": "text-decoration: line-through;",
      "=": "text-decoration: underline line-through;",
      r: "text-decoration: none;font-weight: normal;",
    };

    const styleRegex = /\^(\_|\*|\=|\~|\/|r)(.*?)(?=$|\^r|<\/em>)/;
    while (s.match(styleRegex)) {
      //Any better solution would be appreciated :P
      s = s.replace(
        styleRegex,
        (str, style, inner) => `<em style="${styleDict[style]}">${inner}</em>`
      );
      console.log(s);
    }

    return s.replace(/<span[^>]*><\/span[^>]*>/g, "");

    function colorTrans(str: string) {
      return str
        .replace(
          /\^([0-9])/g,
          (str, color) => `</span><span class="color-${color}">`
        )
        .replace(
          /\^#([0-9A-F]{3,6})/gi,
          (str, color) => `</span><span class="color" style="color: #${color}">`
        )
        .replace(
          /~([a-z])~/g,
          (str, color) => `</span><span class="gameColor-${color}">`
        );
    }
  }

  function escape(unsafe: string): string {
    return String(unsafe)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;");
  }
</script>

<div class="container">
  <div>{serverId}</div>
  <div>{@html colouriseName(name)}</div>
</div>

<style>
  .container {
    display: grid;
    grid-template-columns: 30px auto;
    background: rgba(0, 0, 0, 0.85);
    border-radius: 5px;
    padding: 5px;
  }
</style>
