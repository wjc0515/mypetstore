package com.unitech.petstore.persistence;

import com.unitech.petstore.domain.Sequence;

public interface SequenceMapper {

  Sequence getSequence(Sequence sequence);
  void updateSequence(Sequence sequence);
}
