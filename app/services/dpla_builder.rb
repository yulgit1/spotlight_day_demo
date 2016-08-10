class DplaBuilder < Spotlight::SolrDocumentBuilder
  def to_solr
    [
      {
        id: '1'
      }
    ]
  end
end
