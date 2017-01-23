<character-selection>
  <div class="card">
    <div class="card-block">
      <h1 class="display-3 card-title">Killpoints</h1>
      <p class="card-text">Want to know when you are due for your next legendary?</p>

      <form class="form-inline" onsubmit={ calculateKillpoints }>
        <select ref="region" class="custom-select" onchange = { listRealms }>
          <option selected>Choose region</option>
          <option value="cn">CN</option>
          <option value="eu">EU</option>
          <option value="kr">KR</option>
          <option value="tw">TW</option>
          <option value="us">US</option>
        </select>
        <input type="text" class="form-control" ref="realm" placeholder="Region and realm" data-provide="typeahead" autocomplete="off">
        <input type="text" class="form-control" ref="character" placeholder="Character name">

        <input type="submit" class="btn btn-primary" value="Calculate">
      </form>
    </div>
  </div>
  <script>
    const REALMS = {
      'eu': ['Twisting Nether', 'Talnivarr']
    };

    calculateKillpoints(event) {
      event.preventDefault();

      var region = this.refs.region.value;
      var realm = this.refs.realm.value.trim().toLowerCase();
      var charactername = this.refs.character.value.trim().toLowerCase();

      route([region, realm, charactername].join('/'));
    }

    listRealms(event) {
      $(this.refs.realm).typeahead({ source: REALMS[this.refs.region.value] });
    }
  </script>
</character-selection>
